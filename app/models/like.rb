class Like < ApplicationRecord
  after_save :update_like_counter

  belongs_to :user, class_name: 'User', foreign_key: 'AuthorId'
  belongs_to :post, class_name: 'Post', foreign_key: 'PostId'

  def update_like_counter
    post.increment!(:LikeCounter)
  end

  private :update_like_counter
end
