class Book < ActiveRecord::Base
  attr_accessible :book_genre, :book_id, :book_name, :book_review
end
