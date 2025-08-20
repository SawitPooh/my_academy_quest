Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "home/index"
  root "home#index"
  post "/quests", to: "home#create", as: :quests
  patch "/quests/:id/toggle_status", to: "home#toggle_status", as: :toggle_status_quest
end
