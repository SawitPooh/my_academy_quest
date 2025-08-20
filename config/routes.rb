Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "home/index"
  root "home#index"
  post "/quests", to: "home#create", as: :quests
end
