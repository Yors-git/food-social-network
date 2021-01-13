class User < ApplicationRecord
  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id'

  has_one_attached :photo
  has_one_attached :coverimage

  has_many :followers, class_name: 'Followship', foreign_key: 'user_id'
  has_many :inverse_followers, class_name: 'Followship', foreign_key: 'follower_id'

  def followed_by(user)
    followed_by_ids = user.followers.all.map { |fllr| fllr.follower_id if fllr.user_id == user.id }
    followed_by = User.where(id: followed_by_ids)
  end

  def not_followed_users(user)
    followed_users_ids = user.inverse_followers.all.map { |fllr| fllr.user_id if fllr.follower_id == user.id }
    followed_users_ids << user.id
    followed_users = User.where.not(id: followed_users_ids)
  end
end
