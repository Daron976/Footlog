class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'AuthorId'
  belongs_to :post, foreign_key: 'PostId'

  def update_comment_counter(post)
    comment_count = Comment.where(PostId: post.id).count
    post.update(CommmentsCounter: comment_count)
  end
end

# Comment.create(PostId: first_post.id, AuthorId: second_user.id, Text: 'Hi Tom!' )
# Comment.create(PostId: first_post.id, AuthorId: second_user.id, Text: 'It\'s me Lilly' )
# Comment.create(PostId: first_post.id, AuthorId: second_user.id, Text: 'From microverse' )
# Comment.create(PostId: first_post.id, AuthorId: second_user.id, Text: 'During the ruby on rails module' )
# Comment.create(PostId: first_post.id, AuthorId: second_user.id, Text: 'Working on the dbs' )
# Comment.create(PostId: first_post.id, AuthorId: second_user.id, Text: 'Remember?' )
