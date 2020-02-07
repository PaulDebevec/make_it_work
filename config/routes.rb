Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/projects/:project_id', to: 'projects#show'
  post '/projects/:project_id', to: 'projects#add_contestant'

  get '/contestants', to: 'contestants#index'
end
