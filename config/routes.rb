Rails.application.routes.draw do

  root to: 'home#index'
  
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions'}

  resources :users, only: :show
  resources :friend_ships, only: [:create, :update]

  resources :departments, only: [:index, :show, :destroy]
  resources :participations, only: [:create, :index]
  resources :places, only: :show

  get '/explore', to: 'redirect#redirect'
  get '/profiles/:id', to: 'redirect#redirect'
  get '/:id/places', to: 'redirect#redirect'
  get '/:departmentId/places/:id', to: 'redirect#redirect'

end
