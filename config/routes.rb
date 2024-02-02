Rails.application.routes.draw do
  namespace :crypto do
    get 'live/index'
  end
end
