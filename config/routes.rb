Rails.application.routes.draw do
  namespace :admin do
    get '/' => 'homes#top', as:'home'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as:'about'
    get '/items' => 'items#index', as:'item'
    get '/items/:id' => 'items#show', as:'item_show'
    get '/costomers' => 'costomers#show', as:'costomer_show'
    get '/customers/information/edit' => 'costomers#edit', as:'costomer_edit'
    get '/customers/confirm_withdraw' => 'costomers#confirm_withdraw', as:'costomer_confirm_withdraw'
    get '/cart_items' => 'cart_items#index', as:'cart_items'
    get '/orders/new' => 'orders#new', as:'order_new'
    get '/orders' => 'orders#index', as:'order'
    get '/orders/:id' => 'orders#show', as:'order_show'
    get '/deliveries' => 'deliveries#index', as:'deliveries'
    get '/deliveries/:id/edit' => 'deliveries#edit', as:'deliveries_edit'
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
