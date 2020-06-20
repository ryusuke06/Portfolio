Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations], controllers: {
  sessions:      "admins/sessions",
  passwords:     "admins/passwords"
  }
  devise_for :users, controllers: {
  sessions:      "users/sessions",
  passwords:     "users/passwords",
  registrations: "users/registrations"
  } #showの下に作って/users/sign_upが/[:id]扱いにならないように気をつけよう。

  root "tops#top"
  get "about", to: "tops#about"

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
    get "inquiries/unread", to: "inquiries#unread"
    resources :users, only:[:index, :edit, :update]
    resources :categories, only:[:index, :create, :update]
    resources :tests do
      resource :details, only:[:show]
      resources :details, only:[:update, :destroy]
      resources :results, only:[:update, :destroy]
    end
    resources :inquiries, only:[:index, :show, :update, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
