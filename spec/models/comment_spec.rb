require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

  before { subject.save }

  before(:each) do
    @post = Post.create(AuthorId: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')
    @comment = Comment.create(AuthorId: subject.id, PostId: @post.id,
                              Text: 'This is a test for the most_recent_comments method')
  end

  it 'Text should be equal to input text' do
    text = @comment.Text

    expect(text).to eq('This is a test for the most_recent_comments method')
  end
end
