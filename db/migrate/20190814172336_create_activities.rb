class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()'
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
