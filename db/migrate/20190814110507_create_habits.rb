class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()'

      t.references :user, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :habits, :uuid, unique: true
    add_index :habits, [:user_id, :name], unique: true
  end
end
