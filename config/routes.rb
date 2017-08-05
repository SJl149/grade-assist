Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  get 'about' => 'welcome#about'
  resources :courses
  get 'attendance' => 'daily_grades#attendance'
  get 'homework' => 'daily_grades#homework'

  resources :students 
  resources :daily_grades

  authenticated :user do
    root 'welcome#dashboard', as: :authenticate_root
  end

  root 'welcome#index'
end
