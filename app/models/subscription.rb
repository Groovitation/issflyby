class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :spacecraft

  attr_accessible :user_id, :spacecraft_id
end
