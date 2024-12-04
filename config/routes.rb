Rails.application.routes.draw do
  root to: "maps#index"
  get 'index', to: 'maps#index'

end
