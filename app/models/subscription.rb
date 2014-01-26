class Subscription < ActiveRecord::Base
  attr_accessible :user_id, :spacecraft_id
end
