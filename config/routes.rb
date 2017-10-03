Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "/invoices/find", to: "invoices#find"
      get "/invoices/find_all", to: "invoices#find_all"
      resources :invoices, only: [:index, :show]
    end
  end

end
