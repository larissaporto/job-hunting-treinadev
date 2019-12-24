Rails.application.routes.draw do
  devise_for :headhunters
  devise_for :applicants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'home#index'
  resources :jobs, only: [:index, :new, :create, :show] do
    post 'start', on: :member
  end
  resources :profiles, only: [:edit, :update, :show, :index, :new, :create] do
    get 'my_jobs', on: :member
  end
  resources :applies, only: [:edit, :update, :show]
end
