require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "viewing the index" do
    visit articles_path
    assert_selector "h1", text: "Articles"
  end

  test "index displays all recent articles" do
    Article.create! title:"one", topic:"general"
    Article.create! title:"two", topic:"general"
    visit articles_path
    assert_selector "li", count: 2
  end

  test "maxage can be specified" do
    Article.create! title:"too old", topic:"general", created_at:5.days.ago
    Article.create! title:"new", topic:"general"
    visit "/articles?maxage=5"
    assert_selector "li", count: 1
  end

  test "maxage defaults to 7" do
    Article.create! title:"too old", topic:"general", created_at:7.days.ago
    Article.create! title:"old", topic:"general", created_at:5.days.ago
    Article.create! title:"new", topic:"general"
    visit "/articles"
    assert_selector "li", count: 2
  end
end
