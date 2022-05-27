Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, except: %i[destroy edit update] do
    root to: 'root#index'
    resources :root, except: :index
  end
end
