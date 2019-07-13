require 'test_helper'

class TopPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @top_page = top_pages(:one)
  end

  test "should get index" do
    get top_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_top_page_url
    assert_response :success
  end

  test "should create top_page" do
    assert_difference('TopPage.count') do
      post top_pages_url, params: { top_page: {  } }
    end

    assert_redirected_to top_page_url(TopPage.last)
  end

  test "should show top_page" do
    get top_page_url(@top_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_top_page_url(@top_page)
    assert_response :success
  end

  test "should update top_page" do
    patch top_page_url(@top_page), params: { top_page: {  } }
    assert_redirected_to top_page_url(@top_page)
  end

  test "should destroy top_page" do
    assert_difference('TopPage.count', -1) do
      delete top_page_url(@top_page)
    end

    assert_redirected_to top_pages_url
  end
end
