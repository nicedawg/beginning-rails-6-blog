require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'should create article' do
    article = Article.new

    article.user = users(:eugene)
    article.title = 'Test Article'
    article.body = 'Test body'

    assert article.save
  end

  test 'should find article' do
    article_id = articles(:welcome_to_rails).id
    assert_nothing_raised { Article.find(article_id) }
  end

  test 'should update article' do
    article = articles(:welcome_to_rails)
    article.update(title: 'New title')
    assert_equal 'New title', article.reload.title
  end

  test 'should destroy article' do
    article = articles(:welcome_to_rails)
    article.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Article.find(article.id) }
  end
end
