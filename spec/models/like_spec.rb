require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

  before { subject.save }

  before(:each) do
    @post = Post.create(author_id: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')
    @comment = Comment.create(author_id: subject.id, post_id: @post.id,
                              Text: 'This is a test for the most_recent_comments method')
  end

  it 'author_id should be present and correct' do
    like = Like.new(author_id: subject.id, post_id: @post.id)

    id = like.author_id

    expect(id).to eq(subject.id)
  end
end
