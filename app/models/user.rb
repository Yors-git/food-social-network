class User < ApplicationRecord
  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id'
end
