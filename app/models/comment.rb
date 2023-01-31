class Comment < ApplicationRecord
  after_save :update_comment_counter

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def update_comment_counter
    post.increment!(:CommentCounter)
  end

  private :update_comment_counter
end
