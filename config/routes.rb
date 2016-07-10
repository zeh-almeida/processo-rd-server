
Rails.application.routes.draw do
  resources :visitors, except: [:new, :edit, :destroy] do
    resources :visitations, only: [:index]
  end

  root 'visitors#index'
end
