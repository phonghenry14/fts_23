Rails.application.routes.draw do
  devise_for :users
  root             'static_pages#home'

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'

  resources :users
  resources :examinations
  resources :courses do
    resources :examinations
  end

  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :courses
  end
end
