class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.string :access_token, null: false
      t.string :email, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :api_keys, :access_token, unique: true
  end
end
