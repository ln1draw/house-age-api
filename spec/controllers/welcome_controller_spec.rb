require 'rails_helper'

describe WelcomeController do

  describe 'GET index' do

    it 'is successful' do
      get :index
      expect(response.status).to be 200
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end

  end

end
