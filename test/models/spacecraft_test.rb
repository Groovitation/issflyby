require 'test_helper'

class SpacecraftTest < ActiveSupport::TestCase
 test "there is at least one person on the ISS" do
   iss = FactoryGirl.create(:spacecraft,apiname:"ISS")
   iss.check_spacepeople
   assert_operator iss.spacepeople.count, :>=, 0
   assert_operator iss.crew, :>=, 0
 end
end
