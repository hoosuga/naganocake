Rails.application.routes.draw do
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  }

  namespace :admin do
    get '/' => 'homes#top', as:'home'

    get '/items' => 'items#index', as:'item'
    get '/items/new' => 'items#new', as:'item_new'
    post '/item' => 'items#create', as:'item_create'
    get '/items/:id' => 'items#show', as:'item_show'
    get '/items/:id/edit' => 'items#edit', as:'item_edit'
    patch 'items/:id' => 'items#update', as:'item_update'
    get "/search" => "items#search"

    get '/customers' => 'customers#index', as:'customers'
    get '/customers/:id' => 'customers#show', as:'customers_show'
    get '/customers/:id/edit' => 'customers#edit', as:'customers_edit'
    patch '/customers/:id' => 'customers#update', as:'customers_update'

    get '/orders/:id' => 'orders#show', as:'orders_show'
    patch '/orders/:id' => 'orders#update', as:'orders_update'

    patch '/:order_id/order_details/:id' => 'order_details#update', as:'order_detail_update'

    get '/genres' => 'genres#index', as:'genres'
    post '/genre' => 'genres#create', as:'genres_create'
    get '/genres/:id/edit' => 'genres#edit', as:'genres_edit'
    patch '/genres/:id' => 'genres#update', as:'genres_update'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as:'about'

    get '/items' => 'items#index', as:'item'
    get '/items/:id' => 'items#show', as:'item_show'
    get "/search" => "items#search"

    get '/customers' => 'customers#show', as:'customer_show'
    get '/customers/information/edit' => 'customers#edit', as:'customer_edit'
    patch '/customers/information' => 'customers#update', as:'customer_update'
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw', as:'customer_confirm_withdraw'
    patch '/customers/withdraw' => 'customers#withdraw', as:'customer_withdraw'

    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as:'cart_items_destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]

    get '/orders/new' => 'orders#new', as:'order_new'
    get '/orders/thanks' => 'orders#thanks', as:'order_thanks'
    get '/orders' => 'orders#index', as:'order'
    get '/orders/confirm' => 'orders#confirm', as: 'order_confirm'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/:id' => 'orders#show', as:'order_show'
    post '/orders' => 'orders#create', as:'orders'

    get '/deliveries' => 'deliveries#index', as:'deliveries'
    post '/deliveries' => 'deliveries#create', as:'deliveries_create'
    get '/deliveries/:id/edit' => 'deliveries#edit', as:'deliveries_edit'
    patch '/deliveries/:id' => 'deliveries#update', as:'deliveries_update'
    delete '/deliveries/:id' => 'deliveries#destroy', as:'deliveries_destroy'
  end

end
