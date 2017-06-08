 Rails.application.routes.draw do
  resources :portfoliopages, except: [:show]
  get'portfoliopage/:id',  to: 'portfoliopages#show', as: 'portfoliopage_show'#custom routs metoda

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'#asdfasdf

  resources :blogs

  root to: 'pages#home'
  
end
