class UniquePerformedAtForActivities < ActiveRecord::Migration[6.0]
  def change
    add_index :activities, [:habit_id, :performed_at], unique: true
  end
end
