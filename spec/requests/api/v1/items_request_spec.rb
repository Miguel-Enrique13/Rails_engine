require 'rails_helper'

describe "Items API" do
  describe "Endpoints" do
    it "return a list of items" do
      merchant = create(:merchant)
      create_list(:item, 3, merchant_id: merchant.id)

      get "/api/v1/items"

      expect(response).to be_successful

      items_data = JSON.parse(response.body, symbolize_names: true)

      expect(items_data).to have_key(:data)
      expect(items_data[:data]).to be_an(Array)

      expect(items_data[:data].count).to eq(3)
    end

    it "return a specific item by id" do
      merchant = create(:merchant)
      id = create(:item, merchant_id: merchant.id).id

      get "/api/v1/items/#{id}"

      expect(response).to be_successful

      items_data = JSON.parse(response.body, symbolize_names: true)

      expect(items_data).to have_key(:data)
      expect(items_data[:data]).to be_an(Hash)
    end

    it "Create a new item" do
      merchant = create(:merchant)
      item_params = {
        name: "new item",
        description: "lorem ipsum",
        unit_price: 3.00,
        merchant_id: merchant.id
      }

      headers = {"CONTENT_TYPE" => 'application/json'}

      post '/api/v1/items', headers: headers, params: JSON.generate(item: item_params)

      created_item = Item.last

      expect(response).to be_successful
      expect(created_item.name).to eq(item_params[:name])
      expect(created_item.description).to eq(item_params[:description])
      expect(created_item.unit_price).to eq(item_params[:unit_price])

      item_data = JSON.parse(response.body, symbolize_names: true)

      expect(item_data).to have_key(:data)
      expect(item_data[:data]).to be_an(Hash)
    end

    it "Update item" do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)
      item_params = {
        name: "new item",
        description: "lorem ipsum",
        unit_price: 3.00,
        merchant_id: merchant.id
      }

      headers = {"CONTENT_TYPE" => 'application/json'}

      patch "/api/v1/items/#{item.id}", headers: headers, params: JSON.generate(item: item_params)

      created_item = Item.last

      expect(response).to be_successful
      expect(created_item.name).to eq(item_params[:name])
      expect(created_item.description).to eq(item_params[:description])
      expect(created_item.unit_price).to eq(item_params[:unit_price])

      item_data = JSON.parse(response.body, symbolize_names: true)

      expect(item_data).to have_key(:data)
      expect(item_data[:data]).to be_an(Hash)
    end

    it "destroy an item" do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)

      expect(Item.count).to eq(1)

      delete "/api/v1/items/#{item.id}"

      expect(response).to be_successful
      expect(Item.count).to eq(0)
      expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'relationships' do
    it "return all merchants for one item" do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)

      get "/api/v1/items/#{item.id}/merchants"

      expect(response).to be_successful

      merchant_data = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_data).to have_key(:data)
      expect(merchant_data[:data]).to be_an(Hash)
      expect(merchant_data[:data][:id]).to eq(merchant.id.to_s)
    end
  end
end
