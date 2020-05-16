class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :stars
      t.string :comment
    end 
  end
end
