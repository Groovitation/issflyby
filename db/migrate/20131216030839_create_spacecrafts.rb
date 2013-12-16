class CreateSpacecrafts < ActiveRecord::Migration
  def change
    create_table :spacecrafts do |t|
      t.string :name
      t.integer :crew
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
