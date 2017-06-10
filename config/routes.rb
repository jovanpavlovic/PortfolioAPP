 Rails.application.routes.draw do
  devise_for :users
  resources :portfoliopages, except: [:show]
  get 'angular-items', to: 'portfoliopages#angular'
  get'portfoliopage/:id',  to: 'portfoliopages#show', as: 'portfoliopage_show'#custom routs metoda

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'#asdfasdf

  resources :blogs do
    member do
       get :toggle_status
    end
  end  

  root to: 'pages#home'
  
end
