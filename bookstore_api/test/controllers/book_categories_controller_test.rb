require 'test_helper'

class BookCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_category = book_categories(:one)
  end

  test "should get index" do
    get book_categories_url, as: :json
    assert_response :success
  end

  test "should create book_category" do
    assert_difference('BookCategory.count') do
      post book_categories_url, params: { book_category: { name: @book_category.name } }, as: :json
    end

    assert_response 201
  end

  test "should show book_category" do
    get book_category_url(@book_category), as: :json
    assert_response :success
  end

  test "should update book_category" do
    patch book_category_url(@book_category), params: { book_category: { name: @book_category.name } }, as: :json
    assert_response 200
  end

  test "should destroy book_category" do
    assert_difference('BookCategory.count', -1) do
      delete book_category_url(@book_category), as: :json
    end

    assert_response 204
  end
end
