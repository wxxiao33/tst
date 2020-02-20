require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  # test "should get home" do
  #   get home_page_home_url
  #   assert_response :success
  # end

  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get users" do
    get users_path
    assert_response :success
  end

  test "should get challenges" do
    get challenges_path
    assert_response :success
  end

  test "should get new_user" do
    get new_user_path
    assert_response :success
  end

  test "should get new_challenge" do
    get new_challenge_path
    assert_response :success
  end

end
