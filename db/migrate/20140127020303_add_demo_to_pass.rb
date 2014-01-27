class AddDemoToPass < ActiveRecord::Migration
  def change
    add_column :passes, :demo, :boolean
  end
end
