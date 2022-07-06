Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :list, only: %i[show new create], shallow: true do
    resources :bookmarks, only: %i[create destroy]
    resources :reviews, only: %i[create]
  end
  # resources :bookmarks, only: %i[destroy]
end

# bookmark precisa estar associado a um filme ou uma lista
# shallow: true tira do nesting, organiza as rotas
