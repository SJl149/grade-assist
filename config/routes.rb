Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  get 'about' => 'welcome#about'
  resources :courses

  get 'attendance' => 'daily_grades#attendance'
  patch 'attendance' => 'daily_grades#update_attendance'
  get 'homework' => 'daily_grades#homework'
  patch 'homework' => 'daily_grades#update_homework'
  get 'participation' => 'daily_grades#participation'
  patch 'participation' => 'daily_grades#update_participation'

  resources :students
  resources :daily_grades

  authenticated :user do
    root 'welcome#dashboard', as: :authenticate_root
  end

  root 'welcome#index'
end
