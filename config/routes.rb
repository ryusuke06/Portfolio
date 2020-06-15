Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations], controllers: {
  sessions:      "admins/sessions",
  passwords:     "admins/passwords"
  }
  devise_for :users

  root "tops#top"

  resources :users,only:[:show, :edit, :update]
  resources :tests, only:[:index, :show] do
    resource :favorites, only:[:create, :destroy]
    resource :details, only:[:show]
  end
  resources :results, only:[:show]
  resource :assessments, only:[:create, :destroy]
  resource :inquiries, only:[:new, :create]

  namespace :admins do
    root "tops#top"
    resources :users, only:[:index, :show, :update]
    resources :categories, only:[:index, :create, :update]
    resources :tests do
      resources :details, only:[:show, :update, :destroy]
      resource :results, only:[:update, :destroy]
    end
    resource :details, only:[:create]
    resources :results, only:[:show, :create]
    get "tests/preview"
    resources :inquiries, only:[:index, :show, :update, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
