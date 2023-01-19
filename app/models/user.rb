class User < ApplicationRecord
  has_many :posts, foreign_key: 'AuthorId'
  has_many :comments, foreign_key: 'AuthorId'
  has_many :likes, foreign_key: 'AuthorId'

  def latest_posts
    Post.where(AuthorId: id).last(3)
  end
end
