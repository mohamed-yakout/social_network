class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_create :create_bi_directional_relationship
  after_destroy :destroy_bi_directional_relationship

  private
    def create_bi_directional_relationship
      friend.friendships.create(friend: user)
    end

    def destroy_bi_directional_relationship
      friendship = friend.friendships.find_by(friend: user)
      friendship.destroy if friendship
    end
end
