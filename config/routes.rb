Rails.application.routes.draw do
  namespace :crypto do
    get 'lives/index'
    resources :csv_imports, only: [:new, :create]
    
    get '/csv_exports/show_results', to: 'csv_exports#show_results', as: :show_results
    get 'csv_exports/create'
  end
end
