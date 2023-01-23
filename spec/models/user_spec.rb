require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'Name should be tom' do
    name = subject.Name

    expect(name).to eq('Tom')
  end

  it 'Name should not be blank' do
    subject.Name

    expect(subject).to be_valid
  end

  it 'PostCounter should be zero' do
    val = subject.PostCounter

    expect(val).to eq 0
  end

  it 'PostCounter should be valid' do
    subject.PostCounter

    expect(subject).to be_valid
  end

  it 'latest_posts should return nil' do
    posts = subject.latest_posts

    expect(posts).to eq []
  end

  it 'latest_posts should return 3 of the most recent post' do
    post = Post.create(AuthorId: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')

    latest = subject.latest_posts

    expect(latest).to eq [post]
  end
end
