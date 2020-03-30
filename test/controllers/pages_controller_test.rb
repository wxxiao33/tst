require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    # get root_path
    get root_url
    assert_response :success
  end

  # test "should get about" do
  #   get about_path
  #   assert_response :success
  # end

end
