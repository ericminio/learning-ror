require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  
  test "verify article title via css_select" do
    Article.create! title:"one"
    Article.create! title:"two"
    get articles_path

    assert_equal 2, css_select(".article-title").size
  end

  test "verify article title via assert_select" do
    Article.create! title:"one"
    Article.create! title:"two"
    get articles_path

    assert_select ".article-title", count:2
  end

end
