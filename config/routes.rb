Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :financial_transactions, only: [:index]
      resources :apidocs, only: [:index]
    end
  end
  get '/apidocs' => redirect('swagger-ui/dist/index.html?url=/api/v1/apidocs')
end
