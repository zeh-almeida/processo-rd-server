
Rails.application.routes.draw do
  resources :visitors, only: [:index, :show, :create] do
    resources :visitations, only: [:index]
  end

  root 'visitors#index'
end
