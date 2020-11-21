Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/revenue_with_time_range', to: 'business_intel#revenue_with_time_range'
        get '/most_revenue', to: 'business_intel#most_revenue'
        get '/most_items', to: 'business_intel#most_items'
        get '/:id/revenue', to: 'business_intel#merchant_revenue'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end


      get "/items/find_all", to: 'items/search#index'
      get "/items/find", to: 'items/search#show'


      resources :items do
        get :merchants, only: :show, to: 'items/merchants#index'
      end

      resources :merchants do
        get :items, only: :show, to:'merchants/items#index'
      end
    end
  end
end
