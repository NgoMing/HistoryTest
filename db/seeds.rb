# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.delete_all

10.times do |n|
  Book.create!(name: "Book #{n}")
end

Author.delete_all

10.times do |n|
  Author.create!(name: "Author #{n}")
end

AuthorBookRel.delete_all

# AuthorBookRel.create!(author_id: 51, book_id: 51)
# AuthorBookRel.create!(author_id: 51, book_id: 52)
# AuthorBookRel.create!(author_id: 51, book_id: 53)
# AuthorBookRel.create!(author_id: 52, book_id: 52)
# AuthorBookRel.create!(author_id: 52, book_id: 53)
# AuthorBookRel.create!(author_id: 53, book_id: 54)
# AuthorBookRel.create!(author_id: 53, book_id: 55)
# AuthorBookRel.create!(author_id: 54, book_id: 55)
# AuthorBookRel.create!(author_id: 54, book_id: 56)
# AuthorBookRel.create!(author_id: 55, book_id: 57)
# AuthorBookRel.create!(author_id: 56, book_id: 57)
