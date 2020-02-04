class Article < ApplicationRecord
  validates :title, :body, presence: true

  def long_title
    "#{title} - #{published_at}"
  end
end
