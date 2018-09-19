Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "about", to: "pages#about"
  get "garden", to: "pages#garden"
  get "about_garden", to: "pages#about_garden"
  resources :articles
end
