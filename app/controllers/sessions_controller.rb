class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    # Hiển thị form đăng nhập
  end

  def create
    user = User.find_by(email_address: params[:email_address])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Đăng nhập thành công!"
    else
      flash.now[:alert] = "Email hoặc mật khẩu không đúng."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Đăng xuất thành công!"
  end
end
