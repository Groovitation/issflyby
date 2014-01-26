require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "users can send themselves demo cards" do
    get :demo_card
    assert_redirected_to root_url
  end
end