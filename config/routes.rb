Rails.application.routes.draw do
  namespace :admin do
    get '/' => 'homes#top', as:'home'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as:'about'
    get '/items' => 'items#index', as:'item'
    get '/items/:id' => 'items#show', as:'item_show'
    get '/costomers' => 'costomers#show', as:'costomers_show'
    get '/customers/information/edit' => 'costomers#edit', as:'costomers_edit'
    get '/customers/confirm_withdraw' => 'costomers#confirm_withdraw', as:'costomers_confirm_withdraw'
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
