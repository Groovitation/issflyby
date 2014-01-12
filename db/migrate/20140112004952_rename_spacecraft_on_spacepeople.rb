class RenameSpacecraftOnSpacepeople < ActiveRecord::Migration
  def change
  	rename_column :spacepeople, :Spacecraft_id, :spacecraft_id
  end
end
