class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'AuthorId'
  belongs_to :post, foreign_key: 'PostId'

  def update_likes_counter(post)
    likes_count = Like.where(PostId: post.id).count
    post.update(LikesCounter: likes_count)
  end
end
