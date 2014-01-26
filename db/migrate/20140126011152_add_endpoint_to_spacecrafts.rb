class AddEndpointToSpacecrafts < ActiveRecord::Migration
  def change
    add_column :spacecrafts, :endpoint, :string
  end
end
