require 'spec_helper'

describe "cards/edit" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :mirror_id => "MyString",
      :pass_id => 1
    ))
  end

  it "renders the edit card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", card_path(@card), "post" do
      assert_select "input#card_mirror_id[name=?]", "card[mirror_id]"
      assert_select "input#card_pass_id[name=?]", "card[pass_id]"
    end
  end
end
