class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, length: { in: 5..50 }
  validates :email, format: { with:  /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i }

  has_one :profile
  has_many :articles, -> { order 'published_at DESC, title ASC' },
           dependent: :nullify
  has_many :replies, through: :articles, source: :comments
end
