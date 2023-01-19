class AddDefaultToPost < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :CommentCounter, from: nil, to: 0
    change_column_default :posts, :LikeCounter, from: nil, to: 0
  end
end
