class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    # Kiểm tra nếu người dùng đã đăng nhập thì chuyển hướng về trang chính
    if session[:user_id]
      redirect_to root_path, notice: "Bạn đã đăng nhập rồi!"
    else
      # Hiển thị form đăng nhập
    end
  end

  def create
    # Tìm người dùng dựa trên email_address
    user = User.find_by(email_address: params[:email_address])

    # Kiểm tra nếu người dùng tồn tại và mật khẩu hợp lệ
    if user&.authenticate(params[:password])
      # Đặt user_id trong session
      session[:user_id] = user.id
      redirect_to root_path, notice: "Đăng nhập thành công!"
    else
      # Thông báo lỗi và hiển thị lại form đăng nhập
      flash.now[:alert] = "Email hoặc mật khẩu không đúng."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Xóa thông tin user_id trong session
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Đăng xuất thành công!"
  end
end
