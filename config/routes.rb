Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#welcome'

  if Rails.env.development?
    get 'static/index' => 'static#index'
    get 'static/about' => 'static#about'
    get 'static/news' => 'static#news'
    get 'static/detail' => 'static#detail'
    get 'static/album' => 'static#album'
    get 'static/videos' => 'static#videos'
    get 'static/video_detail' => 'static#video_detail'
  end

  resources :categories, only: [:show], path: :site
  resources :sites, only: [:show], path: :old_site
  resources :company_news,  only: [:index, :show]
  resources :industry_news, only: [:index, :show]
  resources :media_news,    only: [:index, :show]
  resources :albums,        only: [:index]
  resources :videos,        only: [:index, :show]
  get 'news/search' => 'news#search', as: :news_search

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
