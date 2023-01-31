class Like < ApplicationRecord
  after_save :update_like_counter

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def update_like_counter
    post.increment!(:LikeCounter)
  end

  private :update_like_counter
end
