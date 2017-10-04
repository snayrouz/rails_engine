Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace 'merchants' do
        get "find_all", to: "search#index"
        get "find", to: "search#show"
        get "random", to: "random#show"
      end

      namespace 'invoices' do
        get "find_all", to: "search#index"
        get "find", to: "search#show"
        get "random", to: "random#show"
      end

      namespace 'items' do
        get "find_all", to: "search#index"
        get "find", to: "search#show"
        get "random", to: "random#show"
      end

      namespace 'invoice_items' do
        get "find_all", to: "search#index"
        get "find", to: "search#show"
        get "random", to: "random#show"
      end

      resources :merchants, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
