class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.decimal :score
      t.text :comment

      t.timestamps
    end
  end
end
