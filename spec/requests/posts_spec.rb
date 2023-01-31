require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do

    subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

    before{ subject.save}


    before(:each) do
      get "/users/#{subject.id}/posts"
    end

    it 'has correct status code' do
      status = response.status

      expect(status).to eq(200)
    end

    it 'renders correct template' do
      template = 'posts/index'

      expect(template).to render_template(template)
    end

    it 'renders correct template' do
      @post = Post.create(author_id: subject.id, Title: 'dummy post', Text: 'This is a test for the latest_posts method')
      get "/users/#{subject.id}/posts/#{@post.id}"

      template = 'posts/show'

      expect(response).to render_template(template)
    end
  end
end
