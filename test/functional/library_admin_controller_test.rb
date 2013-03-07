require 'test_helper'

class LibraryAdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get categories" do
    get :categories
    assert_response :success
  end

  test "should get about_us" do
    get :about_us
    assert_response :success
  end

  test "should get carrers" do
    get :carrers
    assert_response :success
  end

  test "should get conatct_us" do
    get :conatct_us
    assert_response :success
  end

end
