Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace 'merchants' do
        get "find_all", to: "search#index"
        get "find", to: "search#show"
        get "random", to: "random#show"
        get '/:id/revenue', to: 'revenue#show'
      end

      namespace :transactions do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
        get '/:id/invoice', to: 'invoices#index'
      end

      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
