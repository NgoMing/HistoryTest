class Author < ApplicationRecord
  has_many :author_book_rels, dependent: :destroy
  has_many :books, through: :author_book_rels, autosave: true

  has_paper_trail
end
