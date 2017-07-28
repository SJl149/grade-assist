Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  get 'about' => 'welcome#about'

  authenticated :user do
    root 'welcome#dashboard', as: :authenticate_root
    resources :classes
  end

  root 'welcome#index'
end
