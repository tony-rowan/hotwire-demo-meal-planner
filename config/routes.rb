Rails.application.routes.draw do
  resources :meals, except: :show
end
