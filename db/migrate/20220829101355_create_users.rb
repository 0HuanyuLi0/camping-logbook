class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.string :name
      t.text :password_digest

      t.timestamps
    end
  end
end
