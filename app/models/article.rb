class Article < ApplicationRecord
  validates :title, :body, presence: true

  belongs_to :user

  def long_title
    "#{title} - #{published_at}"
  end
end
