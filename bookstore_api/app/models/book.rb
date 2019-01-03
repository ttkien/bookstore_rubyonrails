# frozen_string_literal: true

class Book < ApplicationRecord
  include PgSearch
  pg_search_scope :search_book, against: %i[title description],
                                using: {
                                  tsearch: {:prefix => true}
                                },
                                associated_against: {
                                  book_category: [:name]
                                }
  belongs_to :book_category
end
