class User < ApplicationRecord
  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id'

  has_one_attached :photo

  has_many :followers, class_name: 'Followship', foreign_key: 'user_id'
  has_many :inverse_followers, class_name: 'Followship', foreign_key: 'follower_id'
end
