Mystuffs::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'welcome#index'

  match 'index' => 'welcome#index', via: :get

  match 'users/sign_in' => 'devise/sessions', action: :new

  resources :stuffs do
    resources :tickets do
      match 'comment/add' => 'comment#add', as:  :add_comment
    end
  end

  match 'comment/edit/:id' => 'comment#edit', as: :edit_comment
  match 'comment/reply/:id' => 'comment#reply', as: :reply_comment

  get 'tags/:tag', to: 'welcome#index', as: :tag
  get 'users/:user', to: 'welcome#index', as: :user
  get 'users', to: 'welcome#users'
end
