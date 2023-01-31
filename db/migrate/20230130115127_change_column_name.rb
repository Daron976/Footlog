class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :AuthorId, :author_id
    rename_column :comments, :PostId, :post_id
    rename_column :likes, :AuthorId, :author_id
    rename_column :likes, :PostId, :post_id
    rename_column :posts, :AuthorId, :author_id
  end
end
