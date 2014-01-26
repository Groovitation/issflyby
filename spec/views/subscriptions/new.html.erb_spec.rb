require 'spec_helper'

describe "subscriptions/new" do
  before(:each) do
    assign(:subscription, stub_model(Subscription,
      :spacecraft_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subscriptions_path, "post" do
      assert_select "input#subscription_spacecraft_id[name=?]", "subscription[spacecraft_id]"
      assert_select "input#subscription_user_id[name=?]", "subscription[user_id]"
    end
  end
end
