require 'nokogiri'
require 'queue_array.rb'

class User < ApplicationRecord

  has_many :headings
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  attr_accessor :path_visit

  HEADING_TYEPS = %w(h1 h2 h3)

  before_validation :set_shorten_url
  after_create :set_headings

  def is_friend? friend
    self.friend_ids.include? friend.id
  end

  def self.shortest_path user_source, user_destination
    will_visit_user_ids = [user_source.id]
    visited_user_ids = {}
    queue = QueueArray.new
    path = []

    queue.push(user_source)

    while !queue.empty? do
      curr_user = queue.pop
      puts "============ #{curr_user.id} ============="
      puts "============ #{curr_user.path_visit.map(&:id)} =============" if curr_user.path_visit
      if curr_user.id == user_destination.id
        curr_user.path_visit << user_destination
        return curr_user.path_visit
      end

      visited_user_ids[curr_user.id] = true

      curr_user.friends.where.not(id: will_visit_user_ids).each do |friend|
        if !visited_user_ids[friend.id]
          friend.path_visit ||= curr_user.path_visit
          friend.path_visit ||= []
          friend.path_visit << curr_user
          queue.push friend
        end
      end
    end

    return []
  end

  def get_response_with_redirect(uri)
    response = Net::HTTP.get_response(uri)
    if response.code == "301"
      response = Net::HTTP.get_response(URI.parse(response.header['location']))
    end
    response
  end

  def get_headings html_type='h1'
    uri = URI.parse(self.original_url)
    # response = Net::HTTP.get_response(uri.host, "/")
    response = get_response_with_redirect(uri)
    body = response.body
    nokogiri_obj = Nokogiri::HTML.fragment(body)
    nokogiri_obj.search(html_type)

    # Net::HTTP.start(uri.host, uri.port) do |http|
    #   response = http.head(uri.path)
    #   puts response
    # end
  end

  def set_headings
    return unless self.headings.blank?
    HEADING_TYEPS.each do |heading_type|
      nokogiri_arr = self.get_headings heading_type
      nokogiri_arr.each do |nokogiri_element|
        Heading.create(user_id: self.id, html_value: nokogiri_element.content,
          html_type: heading_type, html_element: nokogiri_element.to_html)
      end
    end
  end

  protected

    def get_shorten_url
      Bitly.client.shorten(self.original_url).short_url
    end

    def set_shorten_url
      begin
        self.shorten_url = self.get_shorten_url
      rescue => error
        self.errors.add(:original_url, :not_implemented, message: error.to_s)
      end
    end
end
