require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    context 'get #index' do
      before(:each) do
        get '/users/1/posts'
      end

      it 'has correct status code' do
        status = response.status

        expect(status).to eq(200)
      end

      it 'renders correct template' do
        template = 'posts/index'

        expect(response).to render_template(template)
      end

      it 'template includes displays correct text' do
        text = 'These are the posts for this user'

        body = response.body

        expect(body).to include(text)
      end
    end
    context 'get #show' do
      before(:each) do
        get '/users/1/posts/1'
      end

      it 'renders correct template' do
        template = 'posts/show'

        expect(response).to render_template(template)
      end

      it 'template includes displays correct text' do
        text = 'This is the details of the post'

        body = response.body

        expect(body).to include(text)
      end
    end
  end
end
