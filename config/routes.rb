Rails.application.routes.draw do
  # Routes cho người dùng
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy, :show]

  # Routes cho phiên đăng nhập
  resource :session, only: [:new, :create, :destroy]

  # Routes cho việc đặt lại mật khẩu (nếu có)
  resources :passwords, param: :token, only: [:new, :create, :edit, :update]

  # Routes cho bài viết
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy, :show]

  # Route login
  get 'login', to: 'sessions#new', as: 'login'

  # Trang chủ
  root 'posts#index'
end
