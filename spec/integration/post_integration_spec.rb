require 'rails_helper'

RSpec.describe 'users tests', type: :system do
  describe 'users' do
    subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }
    context 'index' do
      before{ subject.save}
      before(:each) do
        @post = Post.create(author_id: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')
        @comment = Comment.create(author_id: subject.id, post_id: @post.id, Text: 'This is a test for the comments')
        visit posts_index_path(subject.id, @post.id)
      end

      it 'shows image user' do
        expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
      end

      it 'shows username of user' do
        expect(page).to have_content('Tom')
      end

      it 'shows number of posts for the user' do
        expect(page).to have_content("Number of posts: ")
      end

      it 'shows post title' do
        expect(page).to have_content("dummy post")
      end

      it 'shows post text' do
        expect(page).to have_content("This is a test for the latest_posts method")
      end

      it 'shows post comment' do
        expect(page).to have_content("This is a test for the comments")
      end

      it 'shows number of likes' do
        expect(page).to have_content("Likes: 0")
      end

      it 'shows number of posts for the user' do
        click_link('dummy post')

        expect(page).to have_button("like post")
      end
    end
    context 'show' do
      before{ subject.save}
      before(:each) do
        @post = Post.create(author_id: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')
        @comment = Comment.create(author_id: subject.id, post_id: @post.id, Text: 'This is a test for the comments')
        visit posts_show_path(subject.id, @post.id)
      end

      it 'shows post title' do
        expect(page).to have_content("dummy post")
      end

      it 'shows username of post author' do
        expect(page).to have_content(subject.Name)
      end

      it 'shows number of comments' do
        expect(page).to have_content("Comments")
      end

      it 'shows number of likes' do
        expect(page).to have_content("Likes")
      end

      it 'shows post body' do
        expect(page).to have_content(@post.Text)
      end

      it 'shows number of comments' do
        expect(page).to have_content("Comments")
      end

      it 'shows comment' do
        expect(page).to have_content(@comment.Text)
      end
    end
  end
end