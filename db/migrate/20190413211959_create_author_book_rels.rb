class CreateAuthorBookRels < ActiveRecord::Migration[5.2]
  def change
    create_table :author_book_rels do |t|
      t.references :author, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
