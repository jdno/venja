class AddPerformedAtToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :performed_at, :date, null: false
  end
end
