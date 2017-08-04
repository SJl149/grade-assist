Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  get 'about' => 'welcome#about'
  resources :courses
  resources :daily_grades
  resources :students

  get 'attendance' => 'daily_grades#attendance'

  authenticated :user do
    root 'welcome#dashboard', as: :authenticate_root
  end

  root 'welcome#index'
end
