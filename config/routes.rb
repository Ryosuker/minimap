Rails.application.routes.draw do
  root to: "maps#index"
  get 'maps/index'

end
