Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    root "home#index"
    resources :atendimentos
    resources :estoques
    resources :servicos
    resources :funcionarios
    resources :clientes
    resources :veiculos
    resources :pecas
    resources :agendamentos do
      patch :update_status, on: :collection
    end
    resources :clientes do
      get :veiculos, on: :member
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
