Rails.application.routes.draw do
  # Routes cho người dùng
  resources :users, only: [:new, :create]

  # Routes cho phiên đăng nhập
  resource :session, only: [:new, :create, :destroy]

  # Routes cho việc đặt lại mật khẩu (nếu có)
  resources :passwords, param: :token, only: [:new, :create, :edit, :update]

  # Routes cho bài viết (cả hai chỉ định rõ các hành động)
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  get 'login', to: 'sessions#new', as: 'login'
  resources :users, only: [:index]

  # Trang chủ
  root 'posts#index'
end
