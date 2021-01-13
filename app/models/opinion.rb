class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :text, presence: true, length: { minimum: 3 }

  def not_followed_users(user)
    followed_users_ids = user.inverse_followers.all.map { |fllr| fllr.user_id if fllr.follower_id == user.id }
    followed_users_ids << user.id
    User.where.not(id: followed_users_ids)
  end
end
