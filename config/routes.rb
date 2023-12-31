# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teachers
  # resources :posts
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users
  root 'manager/students#index'

  namespace :manager do
    resources :classrooms do 

    end

    resources :students do
      member do
        put 'student_restore', to: 'students#student_restore'
        put 'move_higher'
        put 'move_lower'
      end
    end
    get 'student_deleted', to: 'students#student_deleted'
    put 'student_restore', to: 'students#student_restore'
    delete 'permanently_delete/:id', to: 'students#permanently_delete', as: :permanently_delete
  end

  namespace :login do
    resources :logins
  end

  

  get '/admin' => 'manage/admin#index'
end
