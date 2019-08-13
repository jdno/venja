class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :time_zone, null: false, default: "UTC"

      t.timestamps
    end
  end
end
