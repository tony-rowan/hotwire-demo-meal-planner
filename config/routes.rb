Rails.application.routes.draw do
  root "calendars#show"
  resources :meals, except: :show
end
