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

      post '/api/v1/items', headers: headers, params: JSON.generate(item_params)

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

      patch "/api/v1/items/#{item.id}", headers: headers, params: JSON.generate(item_params)

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

  describe "Find Endpoints" do
    it "finds single item by case insensitive search" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      item1 = create(:item, name: "iPhone X", description: 'The most innovative phone ever', unit_price: 1500.00, merchant: merchant1)
      item2 = create(:item, name: "Nokia Phone", description: 'The most indestructible phone ever', unit_price: 500.00, merchant: merchant2)

      #find_by_name

      get "/api/v1/items/find", params: {name: "Phone"}

      expect(response).to be_successful

      item_data = JSON.parse(response.body, symbolize_names: true)

      expect(item_data).to have_key(:data)
      expect(item_data[:data]).to be_an(Array)
      expect(item_data[:data].first[:id]).to eq(item1.id.to_s)

      #find_by_description

      get "/api/v1/items/find", params: {description: "Phone ever"}

      expect(response).to be_successful

      item_data = JSON.parse(response.body, symbolize_names: true)


      expect(item_data).to have_key(:data)
      expect(item_data[:data]).to be_an(Array)
      expect(item_data[:data].first[:id]).to eq(item1.id.to_s)

      #find_by_unit_price

      get "/api/v1/items/find", params: {unit_price: 1500.00}

      expect(response).to be_successful

      item_data = JSON.parse(response.body, symbolize_names: true)


      expect(item_data).to have_key(:data)
      expect(item_data[:data]).to be_an(Array)
      expect(item_data[:data].first[:id]).to eq(item1.id.to_s)

      #find_by_merchant_id

      get "/api/v1/items/find", params: {merchant_id: merchant1.id}

      expect(response).to be_successful

      item_data = JSON.parse(response.body, symbolize_names: true)


      expect(item_data).to have_key(:data)
      expect(item_data[:data]).to be_an(Array)
      expect(item_data[:data].first[:id]).to eq(item1.id.to_s)
    end

    it "finds multiple items by case insensitive search" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      item1 = create(:item, name: "iPhone X", description: 'The most innovative phone ever', unit_price: 1500.00, merchant: merchant1)
      item2 = create(:item, name: "Nokia Phone", description: 'The most indestructible phone ever', unit_price: 1500.00, merchant: merchant2)

      #find_by_name

      get "/api/v1/items/find_all", params: {name: "Phone"}

      expect(response).to be_successful

      item_data = JSON.parse(response.body, symbolize_names: true)

      expect(item_data).to have_key(:data)
      expect(item_data[:data]).to be_an(Array)
      expect(item_data[:data].count).to eq(2)
      expect(item_data[:data].first[:id]).to eq(item1.id.to_s)

      #find_by_description

      get "/api/v1/items/find_all", params: {description: "Phone ever"}

      expect(response).to be_successful

      item_data = JSON.parse(response.body, symbolize_names: true)

      expect(item_data).to have_key(:data)
      expect(item_data[:data]).to be_an(Array)
      expect(item_data[:data].count).to eq(2)
      expect(item_data[:data].first[:id]).to eq(item1.id.to_s)

      #find_by_unit_price

      get "/api/v1/items/find_all", params: {unit_price: 1500.00}

      expect(response).to be_successful

      item_data = JSON.parse(response.body, symbolize_names: true)

      expect(item_data).to have_key(:data)
      expect(item_data[:data]).to be_an(Array)
      expect(item_data[:data].count).to eq(2)
      expect(item_data[:data].first[:id]).to eq(item1.id.to_s)
    end
  end
end
