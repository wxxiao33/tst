require 'test_helper'

class ParticipateInsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participate_in = participate_ins(:one)
  end

  test "should get index" do
    get participate_ins_url
    assert_response :success
  end

  test "should get new" do
    get new_participate_in_url
    assert_response :success
  end

  test "should create participate_in" do
    assert_difference('ParticipateIn.count') do
      post participate_ins_url, params: { participate_in: { challenge_id: @participate_in.challenge_id, continuous_check_in: @participate_in.continuous_check_in, failed: @participate_in.failed, finished: @participate_in.finished, user_id: @participate_in.user_id } }
    end

    assert_redirected_to participate_in_url(ParticipateIn.last)
  end

  test "should show participate_in" do
    get participate_in_url(@participate_in)
    assert_response :success
  end

  test "should get edit" do
    get edit_participate_in_url(@participate_in)
    assert_response :success
  end

  test "should update participate_in" do
    patch participate_in_url(@participate_in), params: { participate_in: { challenge_id: @participate_in.challenge_id, continuous_check_in: @participate_in.continuous_check_in, failed: @participate_in.failed, finished: @participate_in.finished, user_id: @participate_in.user_id } }
    assert_redirected_to participate_in_url(@participate_in)
  end

  test "should destroy participate_in" do
    assert_difference('ParticipateIn.count', -1) do
      delete participate_in_url(@participate_in)
    end

    assert_redirected_to participate_ins_url
  end
end
