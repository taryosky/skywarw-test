Rails.application.routes.draw do
  root 'app#index'

  post "create", to: "app#create"
  get 'create', to: 'app#red'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html       
end
