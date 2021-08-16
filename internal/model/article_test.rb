require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  
  test "should not save article without title" do
    article = Article.new
    assert_not article.save
  end

  test "no fixture seed please" do
    articles = Article.all
    assert_equal 0, articles.size
  end

  test "recent scope" do
    Article.create! title:"too old", topic:"general", created_at:7.days.ago
    Article.create! title:"old", topic:"general", created_at:5.days.ago
    Article.create! title:"new", topic:"general"
    articles = Article.maxage 7

    assert_equal 2, articles.size
  end

end
