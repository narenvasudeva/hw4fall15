class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.text :email
      t.string :session_token

      t.timestamps null: false
    end
  end
end
