require "application_system_test_case"

class ParticipateInsTest < ApplicationSystemTestCase
  setup do
    @participate_in = participate_ins(:one)
  end

  test "visiting the index" do
    visit participate_ins_url
    assert_selector "h1", text: "Participate Ins"
  end

  test "creating a Participate in" do
    visit participate_ins_url
    click_on "New Participate In"

    fill_in "Challenge", with: @participate_in.challenge_id
    fill_in "Continuous check in", with: @participate_in.continuous_check_in
    check "Failed" if @participate_in.failed
    check "Finished" if @participate_in.finished
    fill_in "User", with: @participate_in.user_id
    click_on "Create Participate in"

    assert_text "Participate in was successfully created"
    click_on "Back"
  end

  test "updating a Participate in" do
    visit participate_ins_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @participate_in.challenge_id
    fill_in "Continuous check in", with: @participate_in.continuous_check_in
    check "Failed" if @participate_in.failed
    check "Finished" if @participate_in.finished
    fill_in "User", with: @participate_in.user_id
    click_on "Update Participate in"

    assert_text "Participate in was successfully updated"
    click_on "Back"
  end

  test "destroying a Participate in" do
    visit participate_ins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participate in was successfully destroyed"
  end
end
