class AddLastDemoCardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_demo_card, :datetime
  end
end
