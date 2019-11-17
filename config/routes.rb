Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
    resources :states
    resources :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'home#index'
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'viewpost', to: 'postview#index'
    get 'scholarview', to: 'scholarview#index'
    get 'viewpost/:post', to: 'postview#shown'
    get 'singleposts/:post', to: 'singleposts#index'
    get 'scholarlevels/:level_id', to: 'scholarlevels#index'
    get 'deadline/:type', to: 'deadline#index'
    get 'singlesubjects/:subject', to: 'singlesubjects#index'
    get 'singlescholarships/:id', to: 'singlescholarships#index'
    get 'pageview/:page', to: 'pageview#shown'
    get 'scholarview/:scholarship', to: 'scholarview#shown'
    get 'country/:country', to: 'country#index'
    get 'institute_view/:institute_id', to: 'institute_view#index'
    resources :posts
    resources :scholarships
    resources :categories
    resources :subjects
    resources :institutes
    resources :educations
    resources :keywords
    resources :pages
end
