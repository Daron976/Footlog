class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def latest_posts
    Post.where(AuthorId: id).last(3)
  end
end

# first_user = User.create(Name: 'Tom', Image: 'http://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
# second_user = User.create(Name: 'Lilly', Image: 'http://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Poland.')

# most_recent = User.last(3)
