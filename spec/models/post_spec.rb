require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

  before { subject.save }

  before(:each) do
    @post = Post.create(AuthorId: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')
  end

  it 'Title should be dummy post' do
    title = @post.Title

    expect(title).to eq('dummy post')
  end

  it 'Title should not be blank' do
    @post.Title

    expect(@post).to be_valid
  end

  it 'CommentCounter should be zero' do
    val = @post.CommentCounter

    expect(val).to eq 0
  end

  it 'CommentCounter should be valid' do
    @post.CommentCounter

    expect(@post).to be_valid
  end

  it 'LikeCounter should be zero' do
    val = @post.LikeCounter

    expect(val).to eq 0
  end

  it 'LikeCounter should be valid' do
    @post.LikeCounter

    expect(@post).to be_valid
  end

  it 'most_recent_comments should return nil' do
    comments = @post.most_recent_comments

    expect(comments).to eq []
  end

  it 'most_recent_comments should return 3 of the most recent post' do
    comment = Comment.create(AuthorId: subject.id, PostId: @post.id,
                             Text: 'This is a test for the most_recent_comments method')

    latest = @post.most_recent_comments

    expect(latest).to eq [comment]
  end

  # it 'PostCounter should be 1' do
  #   Post.create(AuthorId: subject.id, Title: 'dummy post', Text: 'This is a test for the most_recent_posts method')

  #   counter = subject.PostCounter

  #   expect(counter).to eq 1
  # end
end
