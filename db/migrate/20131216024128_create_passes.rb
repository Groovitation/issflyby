class CreatePasses < ActiveRecord::Migration
  def change
    create_table :passes do |t|
      t.datetime :risetime
      t.integer :duration
      t.integer :user_id

      t.timestamps
    end
  end
end
