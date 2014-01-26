class RemoveCraftFromSpacepeople < ActiveRecord::Migration
  def change
    remove_column :spacepeople, :craft
  end
end
