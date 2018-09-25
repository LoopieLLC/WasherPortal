class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :role
      t.integer :confirmation_status

      t.timestamps
    end
  end
end