class User < ApplicationRecord
  has_one :profile
  has_many :articles, -> { order 'published_at DESC' }
end
