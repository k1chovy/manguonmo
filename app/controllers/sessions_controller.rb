class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    # Kiểm tra nếu đã đăng nhập, chuyển hướng về trang chủ
    if session[:user_id]
      redirect_to root_path, notice: "Bạn đã đăng nhập rồi!"
    else
      # Hiển thị form đăng nhập
    end
  end

  def create
    user = User.find_by(email_address: params[:email_address])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      Rails.logger.info "Đăng nhập thành công: user_id=#{session[:user_id]}"
      redirect_to root_path, notice: "Đăng nhập thành công!"
    else
      flash.now[:alert] = "Email hoặc mật khẩu không đúng."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Đăng xuất thành công!"
  end
end
