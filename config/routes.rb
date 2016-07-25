Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#welcome'

  devise_for :users

  get 'static/index' => 'static#index'
  get 'static/about' => 'static#about'
  get 'static/news' => 'static#news'
  get 'static/detail' => 'static#detail'
  get 'static/album' => 'static#album'
  get 'static/videos' => 'static#videos'
end
