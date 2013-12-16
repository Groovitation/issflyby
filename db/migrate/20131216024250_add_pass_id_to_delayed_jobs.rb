class AddPassIdToDelayedJobs < ActiveRecord::Migration
  def change
    add_column :delayed_jobs, :pass_id, :integer
  end
end
