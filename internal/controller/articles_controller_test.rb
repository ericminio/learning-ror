require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  @@spy = 42
  def self.remember(value)
    @@spy = value
  end

  test "propagates maxage criteria" do
    def Article.maxage(value)
      ArticlesControllerTest.remember(value)
      []
    end
    get "/articles?maxage=3"
    
    assert_equal 3, @@spy
  end

  test "defaults maxage if absent" do
    def Article.maxage(value)
      ArticlesControllerTest.remember(value)
      []
    end
    get articles_path
    
    assert_equal 7, @@spy
  end

end
