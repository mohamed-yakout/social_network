class User < ApplicationRecord

  after_save :set_shorten_url

  protected

    def get_shorten_url
      Bitly.client.shorten(self.original_url).short_url
    end

    def set_shorten_url
      self.update_column(:shorten, self.get_shorten_url)
    end
end
