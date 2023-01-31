class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def latest_posts
    Post.where(author_id: id).last(3)
  end

  validates :Name, presence: true
  validates :PostCounter, numericality: { greater_than_or_equal_to: 0 }
end
