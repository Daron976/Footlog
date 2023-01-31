require 'rails_helper'

RSpec.describe 'users tests', type: :system do
  describe 'users' do
    subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }
    context 'index' do
      before{ subject.save}
      before(:each) do
        visit root_path
      end
      
      it 'shows username of all users' do
        expect(page).to have_content('Tom')
      end

      it 'shows image of all users' do
        expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
      end

      it 'shows number of posts of all users' do
        expect(page).to have_content("Number of posts")
      end

      it 'shows the next page after click' do

        click_link('Tom')

        expect(page).to have_content("Bio")
      end
    end
    context 'show' do
      before{ subject.save}
      before(:each) do
        @post = Post.create(author_id: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')
        visit users_show_path(subject.id)
      end

      it 'shows user profile picture' do
        expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
      end

      it 'shows username' do
        expect(page).to have_content('Tom')
      end

      it 'shows number of post user' do
        expect(page).to have_content("Comments: 0")
      end

      it 'shows bio of user' do
        expect(page).to have_content("Teacher from Mexico")
      end

      it 'shows the next page after click' do
        click_button('See all posts')

        expect(page).to have_content("dummy post")
      end

      it 'shows bio of user' do
        expect(page).to have_button("See all posts")
      end

      it 'shows the next page after click' do
        click_link('dummy post')

        expect(page).to have_button("like post")
      end
    end
  end
end