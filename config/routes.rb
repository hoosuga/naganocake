Rails.application.routes.draw do
  namespace :admin do
    get '/' => 'homes#top', as:'home'
  end
  
  namespace :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as:'about'
    get '/items' => 'items#index', as:'items'
    get '/items/:id' => 'items#show', as:'items_show'
  end
 
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  }


end
