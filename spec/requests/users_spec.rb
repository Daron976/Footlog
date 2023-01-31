require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'get requests' do
    subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }
    before { subject.save }
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
    end

    context 'get #show' do
      before(:each) do
        get "/users/#{subject.id}"
      end

      it 'renders correct template' do
        template = 'users/show'

        expect(response).to render_template(template)
      end
    end
  end
end
