require "application_system_test_case"

class CampaignsTest < ApplicationSystemTestCase
  setup do
    @campaign = campaigns(:one)
  end

  test "visiting the index" do
    visit campaigns_url
    assert_selector "h1", text: "Campaigns"
  end

  test "creating a Campaign" do
    visit campaigns_url
    click_on "New Campaign"

    fill_in "Link", with: @campaign.link
    fill_in "Paymentamount", with: @campaign.paymentamount
    fill_in "Paymenttype", with: @campaign.paymenttype
    fill_in "Title", with: @campaign.title
    fill_in "User", with: @campaign.user_id
    click_on "Create Campaign"

    assert_text "Campaign was successfully created"
    assert_selector "h1", text: "Campaigns"
  end

  test "updating a Campaign" do
    visit campaign_url(@campaign)
    click_on "Edit", match: :first

    fill_in "Link", with: @campaign.link
    fill_in "Paymentamount", with: @campaign.paymentamount
    fill_in "Paymenttype", with: @campaign.paymenttype
    fill_in "Title", with: @campaign.title
    fill_in "User", with: @campaign.user_id
    click_on "Update Campaign"

    assert_text "Campaign was successfully updated"
    assert_selector "h1", text: "Campaigns"
  end

  test "destroying a Campaign" do
    visit edit_campaign_url(@campaign)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Campaign was successfully destroyed"
  end
end
