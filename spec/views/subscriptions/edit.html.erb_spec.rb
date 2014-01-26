require 'spec_helper'

describe "subscriptions/edit" do
  before(:each) do
    @subscription = assign(:subscription, stub_model(Subscription,
      :spacecraft_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subscription_path(@subscription), "post" do
      assert_select "input#subscription_spacecraft_id[name=?]", "subscription[spacecraft_id]"
      assert_select "input#subscription_user_id[name=?]", "subscription[user_id]"
    end
  end
end
