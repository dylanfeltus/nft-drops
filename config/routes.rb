Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :subscribers, only: [:create]

  put "/subscribers/:wallet" => "subscribers#update"

  # authenticate :admin_user do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/admin/sidekiq'
  # end
end
