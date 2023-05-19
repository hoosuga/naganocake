Rails.application.routes.draw do
  devise_for :admins

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  root to: 'homes#top'
  get '/about' => 'homes#about', as:'about'
end
