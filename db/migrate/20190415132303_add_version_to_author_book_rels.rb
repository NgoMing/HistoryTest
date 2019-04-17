class AddVersionToAuthorBookRels < ActiveRecord::Migration[5.2]
  def change
    add_column :author_book_rels, :version_no, :integer
  end
end
