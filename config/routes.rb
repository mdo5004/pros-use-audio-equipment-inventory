Rails.application.routes.draw do

    root 'welcome#home'

    get "/signin", to: "session#new"
    post "/signin", to: "session#create"
    delete "/signout", to: "session#destroy"
    get "/signup", to: "users#new"
    
    resources :items
    resources :rigs
    resources :users do
        resources :rigs
    end

end
