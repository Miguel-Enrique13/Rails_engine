Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items do
        get :merchants, only: :show, to: 'items/merchants#index'
      end

      resources :merchants do
        get :items, only: :show, to:'merchants/items#index'
      end


    end
  end
end
