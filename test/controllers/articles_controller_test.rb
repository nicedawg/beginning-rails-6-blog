require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:welcome_to_rails)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    login_as :eugene
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    login_as :eugene
    assert_difference('Article.count') do
      post articles_url, params: { article: { body: @article.body, excerpt: @article.excerpt, location: @article.location, published_at: @article.published_at, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    login_as :eugene
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    login_as :eugene
    patch article_url(@article), params: { article: { body: @article.body, excerpt: @article.excerpt, location: @article.location, published_at: @article.published_at, title: @article.title } }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    login_as :eugene
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
