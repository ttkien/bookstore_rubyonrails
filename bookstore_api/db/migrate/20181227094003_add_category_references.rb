class AddCategoryReferences < ActiveRecord::Migration[5.2]
  def up
    add_reference :books, :book_category, foreign_key: true
  end
end
