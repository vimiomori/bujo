Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'
  get 'about', to: 'welcome#about'

  get 'signup', to: 'users#new'
  resources :users, except: [:new] do
    resources :journal_entries, only: [:index, :new, :create, :destroy]
  end
  resources :journal_entries, only: [:update]

  get 'journal_entry/:id', to: 'journal_entries#show', as: 'show_journal_entry'
  get 'journal_entry/:id/edit', to: 'journal_entries#edit', as: 'edit_journal_entry'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
