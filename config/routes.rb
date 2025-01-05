Rails.application.routes.draw do
  # Routes cho người dùng
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy, :show]

  # Routes cho phiên đăng nhập
  resource :session, only: [:new, :create, :destroy]

  # Alias cho trang login
  get 'login', to: 'sessions#new', as: 'login'

  # Alias cho logout (nếu cần)
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # Routes cho việc đặt lại mật khẩu
  resources :passwords, param: :token, only: [:new, :create, :edit, :update]

  # Routes cho bài viết
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy, :show]

  # Trang chủ
  root 'posts#index'
end
