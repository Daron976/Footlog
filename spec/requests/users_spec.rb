require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'get requests' do
    context 'get #index' do
      before(:each) do
        get '/'
      end

      it 'has correct status code' do
        status = response.status

        expect(status).to eq(200)
      end

      it 'renders correct template' do
        template = 'users/index'

        expect(response).to render_template(template)
      end

      it 'template includes displays correct text' do
        text = 'These are the available users'

        body = response.body

        expect(body).to include(text)
      end
    end

    context 'get #show' do
      before(:each) do
        get '/users/1'
      end

      it 'renders correct template' do
        template = 'users/show'

        expect(response).to render_template(template)
      end

      it 'template includes displays correct text' do
        text = 'This is the details of this users'

        body = response.body

        expect(body).to include(text)
      end
    end
  end
end
