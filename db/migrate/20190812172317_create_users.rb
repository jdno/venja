class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
       t.uuid :uuid, null: false, default: 'gen_random_uuid()'

      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false

      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :remember_token, unique: true
  end
end
