Rails.application.routes.draw do
  root "calendar#show"

  resources :meals, except: %i[index show]
end
