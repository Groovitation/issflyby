class AddApinameToSpacecrafts < ActiveRecord::Migration
  def change
    add_column :spacecrafts, :apiname, :string
  end
end
