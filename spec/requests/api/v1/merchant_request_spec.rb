require 'rails_helper'

describe 'Merchant API' do
  describe 'Endpoints' do
    it "returns a list of merchants" do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants_data = JSON.parse(response.body, symbolize_names: true)

      expect(merchants_data).to have_key(:data)
      expect(merchants_data[:data]).to be_an(Array)

      expect(merchants_data[:data].count).to eq(3)
    end

    it "return a specific merchant" do
      merchant = create(:merchant)
      id = merchant.id

      get "/api/v1/merchants/#{id}"

      expect(response).to be_successful

      merchant_data = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_data).to have_key(:data)
      expect(merchant_data[:data]).to be_an(Hash)
    end

    it "create a new merchant" do
      merchant_params = {
        name: "new merchant"
      }

      headers = {"CONTENT_TYPE" => 'application/json'}

      post '/api/v1/merchants', headers: headers, params: JSON.generate(merchant: merchant_params)

      created_merchant = Merchant.last

      expect(response).to be_successful
      expect(created_merchant.name).to eq(merchant_params[:name])

      merchant_data = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_data).to have_key(:data)
      expect(merchant_data[:data]).to be_an(Hash)
    end

    it "update merchant" do
      merchant = create(:merchant)
      merchant_params = {
        name: "new merchant"
      }

      headers = {"CONTENT_TYPE" => 'application/json'}

      patch "/api/v1/merchants/#{merchant.id}", headers: headers, params: JSON.generate(merchant: merchant_params)

      created_merchant = Merchant.last

      expect(response).to be_successful
      expect(created_merchant.name).to eq(merchant_params[:name])

      merchant_data = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_data).to have_key(:data)
      expect(merchant_data[:data]).to be_an(Hash)
    end

    it "destroy merchant" do
      merchant = create(:merchant)

      expect(Merchant.count).to eq(1)

      delete "/api/v1/merchants/#{merchant.id}"

      expect(response).to be_successful
      expect(Merchant.count).to eq(0)
      expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
