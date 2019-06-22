require 'nokogiri'

class User < ApplicationRecord

  has_many :headings

  before_validation :set_shorten_url

  def get_response_with_redirect(uri)
    response = Net::HTTP.get_response(uri)
    if response.code == "301"
      response = Net::HTTP.get_response(URI.parse(response.header['location']))
    end
    response
  end

  def get_headers
    uri = URI.parse(self.original_url)
    # response = Net::HTTP.get_response(uri.host, "/")
    response = get_response_with_redirect(uri)
    body = response.body
    nokogiri_obj = Nokogiri::HTML.fragment(body)
    nokogiri_obj.search('h1')

    # Net::HTTP.start(uri.host, uri.port) do |http|
    #   response = http.head(uri.path)
    #   puts response
    # end
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
