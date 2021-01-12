class User < ApplicationRecord
  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id'

  has_one_attached :photo

  has_many :followers, class_name: 'Followship', foreign_key: 'user_id'
  has_many :inverse_followers, class_name: 'Followship', foreign_key: 'follower_id'

  def followed_by(user)
    followed_by_ids = user.followers.all.map { |fllr| fllr.follower_id if fllr.user_id == user.id }
    followed_by = User.where(id: followed_by_ids)
  end

end
