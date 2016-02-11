Rails.application.routes.draw do
  
  resources :episodes

  root 'pages#index'


end
