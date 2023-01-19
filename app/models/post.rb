class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'AuthorId'
  has_many :likes
  has_many :comments

  def update_post_counter(user)
    post_count = Post.where(AuthorId: user.id).count
    user.update(PostCounter: post_count)
  end

  def most_recent_comments
    Comment.where(PostId: id).last(5)
  end
end

# Post.create(AuthorId: first_user.id, Title: 'Hello', Text: 'This is my first post')
# Post.create(AuthorId: first_user.id, Title: 'Hello again', Text: 'This is my second post')
# Post.create(AuthorId: user.id, Title: 'Me again', Text: 'This is my third post')
# Post.create(AuthorId: user.id, Title: 'Last one', Text: 'This is my final post')

# most_recent_posts = Post.last(5)
