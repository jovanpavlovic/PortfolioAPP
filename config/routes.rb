 Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }#menjaje putanje http://localhost:3000/users/sign_up
  resources :portfoliopages, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfoliopages#angular'
  get'portfoliopage/:id',  to: 'portfoliopages#show', as: 'portfoliopage_show'#custom routs metoda

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :blogs do
    member do
       get :toggle_status
    end
  end  

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end