Rails.application.routes.draw do
  namespace :crypto do
    get 'live/index'
    resources :investment_csv_import, only: [:new, :create]
  end
end
