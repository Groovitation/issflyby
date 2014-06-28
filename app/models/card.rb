class Card < ActiveRecord::Base
  attr_accessible :mirror_id, :pass_id
  belongs_to :pass

  before_destroy :remove_from_timeline

  def remove_from_timeline
    # removal temporarily suspended to assist with approval process
    # HTTParty.delete('https://www.googleapis.com/mirror/v1/timeline/'+self.mirror_id.to_s, headers: { 'Content-Type' => 'application/json', 'Authorization' => 'Bearer '+self.pass.user.access_token })
  end
end
