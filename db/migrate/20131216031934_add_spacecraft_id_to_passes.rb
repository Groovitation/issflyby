class AddSpacecraftIdToPasses < ActiveRecord::Migration
  def change
    add_column :passes, :spacecraft_id, :integer
  end
end
