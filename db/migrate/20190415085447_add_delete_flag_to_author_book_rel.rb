class AddDeleteFlagToAuthorBookRel < ActiveRecord::Migration[5.2]
  def change
    add_column :author_book_rels, :delete_flag, :boolean
  end
end
