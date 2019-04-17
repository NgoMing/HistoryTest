class Book < ApplicationRecord
  has_many :author_book_rels, dependent: :destroy
  has_many :authors, through: :author_book_rels, autosave: true

  has_paper_trail
end
