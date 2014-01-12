class RenameSpacecraftOnSpacepeople < ActiveRecord::Migration
  def change
  	rename_column :spacepeople, :spacecraft_id, :spacecraft_id
  end
end
