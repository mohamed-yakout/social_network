class User < ApplicationRecord

  before_validation :set_shorten_url

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
