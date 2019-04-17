class AuthorBookRel < ApplicationRecord
  belongs_to :author
  belongs_to :book

  has_paper_trail
end
