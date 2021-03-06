Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shelters#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show', as: :shelter
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy', as: :delete_shelter
  
  get '/pets', to: 'pets#index'
  get '/shelters/:id/pets', to: 'shelters#pet_index'
  get '/pets/:id', to: 'pets#show', as: 'pet'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy', as: :delete_pet
  patch '/pets/:id/pending', to: 'pets#change_status_to_pending'
  patch '/pets/:id/adoptable', to: 'pets#change_status_to_adoptable'
end
