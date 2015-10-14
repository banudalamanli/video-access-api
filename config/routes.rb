Rails.application.routes.draw do
  resources :videos, except: [:new, :edit, :show]

  root 'videos#index'
end
