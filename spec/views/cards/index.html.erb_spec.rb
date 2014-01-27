require 'spec_helper'

describe "cards/index" do
  before(:each) do
    assign(:cards, [
      stub_model(Card,
        :mirror_id => "Mirror",
        :pass_id => 1
      ),
      stub_model(Card,
        :mirror_id => "Mirror",
        :pass_id => 1
      )
    ])
  end

  it "renders a list of cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mirror".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
