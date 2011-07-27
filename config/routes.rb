Eskvalleytales::Application.routes.draw do
  match '/' => 'users#index'

  match 'user/:login' => 'user#show'
  match 'user/:search' => 'user#search'
  resource :sessions
  match 'session/:destroy' => 'sessions#destroy'
  resources :comments
  resources :users
  resources :subcomments

  resources :users do  
      resources :comments do
         resources  :subcomments
     end
  end

  resources :comments do  
      resources :subcomments
  end

  resources :users do
        resources :emails
  end

  resources :userss do  
      resources :fiendships
  end

  resources :users do  
      resources :subcomments
  end

  match '/:controller(/:action(/:id))'
end

