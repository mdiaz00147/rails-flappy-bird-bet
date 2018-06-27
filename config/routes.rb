Rails.application.routes.draw do
  resources :payments
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#landing'
  
  get 'about', to: 'static_pages#about'
  get 'contest', to: 'static_pages#contest'
  get 'game', to: 'static_pages#game'
  get 'practice', to: 'static_pages#practice'
  
  scope 'api' do
  	post 'update_score', to: 'turns#create'
  	get 'check', to: 'turns#check'
  end
end
