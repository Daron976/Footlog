class Post < ApplicationRecord
  after_save :update_post_counter

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  def most_recent_comments
    Comment.where(post_id: id).last(5)
  end

  def update_post_counter
    user.increment!(:PostCounter)
  end

  private :update_post_counter

  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :LikeCounter, numericality: { greater_than_or_equal_to: 0 }
end
