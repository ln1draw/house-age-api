require 'rails_helper'

describe SearchesController do

  let(:property) { Property.create(parcel_number: "0942000275", address: "1000 FOURTH AVE",
                                   year_built: "2004", property_type: "Commercial") }

  describe 'GET index' do

    context 'returns by address' do

      it 'succeeds with valid request' do
        get :index, { address: "1000 FOURTH AVE", format: :json }
        expect(response.status).to eq 200
      end

      it 'renders template with valid request' do
        get :index, { address: "1000 FOURTH AVE", format: :json }
        expect(response).to render_template(:index)
      end

      it 'assigns @results with valid request' do
        get :index, { address: "1000 FOURTH AVE", format: :json }
        expect(assigns(:results)).to eq [property]
      end

      it 'does not return results when no match' do
        get :index, { address: "3215 E MERCER ST", format: :json }
        expect(assigns(:results)).to eq []
      end

    end

    context 'returns by parcel' do

      it 'succeeds with valid request' do
        get :index, { parcel: "0942000275", format: :json }
        expect(response.status).to eq 200
      end

      it 'renders template with valid request' do
        get :index, { parcel: "0942000275", format: :json }
        expect(response).to render_template(:index)
      end

      it 'assigns @results with valid request' do
        get :index, { parcel: "0942000275", format: :json }
        expect(assigns(:results)).to eq [property]
      end

      it 'does not return results when no match' do
        get :index, { parcel: "0942094234", format: :json }
        expect(assigns(:results)).to eq []
      end

    end

    context 'returns by year' do

      it 'succeeds with valid request' do
        get :index, { year: "2004", format: :json }
        expect(response.status).to eq 200
      end

      it 'renders template with valid request' do
        get :index, { year: "2004", format: :json }
        expect(response).to render_template(:index)
      end

      it 'assigns @results with valid request' do
        get :index, { year: "2004", format: :json }
        expect(assigns(:results)).to eq [property]
      end

      it 'does not return results when no match' do
        get :index, { year: "2014", format: :json }
        expect(assigns(:results)).to eq []
      end

    end

    context 'empty request' do

      it 'succeeds with invalid request' do
        get :index, format: :json
        expect(response.status).to eq 200
      end

      it 'renders template with invalid request' do
        get :index, format: :json
        expect(response).to render_template(:index)
      end

      it 'returns no results' do
        get :index, format: :json
        expect(assigns(:results)).to eq []
      end

    end

  end

end
