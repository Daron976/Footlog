class Comment < ApplicationRecord
  after_save :update_comment_counter

  belongs_to :user, class_name: 'User', foreign_key: 'AuthorId'
  belongs_to :post, class_name: 'Post', foreign_key: 'PostId'

  def update_comment_counter
    post.increment!(:CommmentsCounter)
  end

  private :update_comment_counter
end
