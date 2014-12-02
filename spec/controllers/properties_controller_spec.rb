require 'rails_helper'

describe PropertiesController do

  let(:property) { Property.create(parcel_number: "0942000275", address: "1000 FOURTH AVE",
                                   year_built: 2004, property_type: "Commercial") }

  describe 'GET index' do

    it 'is successful' do
      get :index, format: :json
      expect(response.status).to be 200
    end

    it 'renders index template' do
      get :index, format: :json
      expect(response).to render_template(:index)
    end

  end

  describe 'GET show' do

    it 'is successful' do
      get :show, { id: property.id, format: :json }
      expect(response.status).to be 200
    end

    it 'renders show template' do
      get :show, { id: property.id, format: :json }
      expect(response).to render_template(:show)
    end

  end

end
