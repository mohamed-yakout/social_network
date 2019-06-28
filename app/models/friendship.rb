class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  validate :friend_not_same_uer

  after_create :create_bi_directional_relationship
  after_destroy :destroy_bi_directional_relationship

  private
    def create_bi_directional_relationship
      friend.friendships.create(friend_id: self.user_id)
    end

    def destroy_bi_directional_relationship
      friendship = friend.friendships.find_by(friend_id: self.user_id)
      friendship.destroy if friendship
    end

    def friend_not_same_uer
      errors.add(:friend, "can't be equal to user") if user == friend
    end
end
