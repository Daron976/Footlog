require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

  before { subject.save }

  before(:each) do
    @post = Post.create(AuthorId: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')
    @comment = Comment.create(AuthorId: subject.id, PostId: @post.id,
                              Text: 'This is a test for the most_recent_comments method')
  end

  it 'AuthorId should be present and correct' do
    like = Like.new(AuthorId: subject.id, PostId: @post.id)

    id = like.AuthorId

    expect(id).to eq(subject.id)
  end
end
