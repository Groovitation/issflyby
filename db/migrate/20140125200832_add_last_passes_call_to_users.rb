class AddLastPassesCallToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_passes_call, :datetime
  end
end
