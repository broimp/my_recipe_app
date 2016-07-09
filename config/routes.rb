Rails.application.routes.draw do
  resources :recipe_apps, except: [:show, :destroy]
  get 'static_pages/directions', as: 'directions'
  root 'recipe_apps#new'
end
