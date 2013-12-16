class CreateSpacepeople < ActiveRecord::Migration
  def change
    create_table :spacepeople do |t|
      t.string :name
      t.string :craft
      t.belongs_to :Spacecraft, index: true

      t.timestamps
    end
  end
end
