require 'test_helper'

class PassTest < ActiveSupport::TestCase
  test "sun_permits should pass a pass 4 minutes before sunrise" do
    arlington_user = FactoryGirl.create(:user,lat:32.705033,long:-97.122839)

    assert_difference "Pass.count" do
    	#FactoryGirl.create(:pass,risetime:DateTime.new(2014,01,11,13,5,0,0),user_id:arlington_user.id)
      Pass.create(risetime:DateTime.new(2014,01,11,13,5,0,0),user_id:arlington_user.id)
    end
  end

  test "sun_permits should fail a pass 4 minutes after sunrise" do
    arlington_user = FactoryGirl.create(:user,lat:32.705033,long:-97.122839)

    assert_no_difference "Pass.count" do
    	Pass.create(risetime:DateTime.new(2014,01,11,21,0,0,0),user_id:arlington_user.id)
    end
  end
end
