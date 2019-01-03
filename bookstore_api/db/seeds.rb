# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_titles = ["Comic", "Real estate", "Business", "Novel", "Politics"]

category_titles.each do |category_title|
  category = BookCategory.create(name: category_title)
end


BookCategory.all.each do |category|
  book_title = "#{category.name}\'s book"
  book = Book.create(book_category_id: category.id, title: book_title, description: "description")
end
