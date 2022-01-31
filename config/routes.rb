Rails.application.routes.draw do
  resources :ips, only: [:index, :create]
end
