Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/', to: 'welcome#index'

    get '/shelters', to: 'shelters#index'
    get '/shelters/new', to: 'shelters#new'
    post '/shelters', to: 'shelters#create'
    get '/shelters/:id', to: 'shelters#show'
    get '/shelters/:id/edit', to: 'shelters#edit'
    patch '/shelters/:id', to: 'shelters#update'
    delete '/shelters/:id', to: 'shelters#destroy'
    # get '/shelters/:id/pets/new', to: 'shelters#new_pet'
    # post '/shelters/:id/pets', to: 'shelters#create_pet'

    get '/pets', to: 'pets#index'
    get '/shelters/:id/pets', to: 'pets#index'
    get '/shelters/:id/pets/new', to: 'pets#new'
    post '/shelters/:id/pets', to: 'pets#create'

    # get '/pets/new', to: 'pets#new'
    # post '/pets', to: 'pets#create'
    get '/pets/:id', to: 'pets#show'
    get '/pets/:id/edit', to: 'pets#edit'
    patch '/pets/:id', to: 'pets#update'
    delete '/pets/:id', to: 'pets#destroy'
    patch '/pets/:id/pending', to: 'pets#is_pending'
    patch '/pets/:id/adoptable', to: 'pets#is_adoptable'

    # get '/shelters/:id/pets', to: 'shelters#pets'
    get '/shelters/:id/pets', to: 'pets#index'
    # get '/shelters/:id/pets', to: 'pets#index'



end
