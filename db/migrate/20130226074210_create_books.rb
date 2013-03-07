class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :book_id
      t.string :book_genre
      t.text :book_review

      t.timestamps
    end
  end
end
