Rails.application.routes.draw do

    root 'welcome#home'

    get "/signin", to: "session#new"
    post "/signin", to: "session#create"
    delete "/signout", to: "session#destroy"
    get "/signup", to: "users#new"
    get '/auth/facebook/callback', to: 'session#create'
    
    get '/items/:id/next', to: 'items#next_item'
    get '/items/:id/prev', to: 'items#prev'
    
    resources :users do
        resources :rigs
    end
    resources :items
    resources :rigs do
        resources :items
    end

end
