class Heading < ApplicationRecord
  belongs_to :user

  self.per_page = 20
end
