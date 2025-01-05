class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    # Khởi tạo đối tượng User mới để hiển thị form đăng ký
    @user = User.new
  end

  def create
    # Tạo người dùng mới dựa trên params
    @user = User.new(user_params)
    if @user.save
      # Điều hướng đến trang đăng nhập với thông báo thành công
      redirect_to new_session_path, notice: "Đăng ký thành công! Vui lòng đăng nhập."
    else
      # Hiển thị lại form đăng ký với lỗi
      flash.now[:alert] = "Đăng ký không thành công. Vui lòng kiểm tra thông tin."
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Chỉ cho phép các tham số cần thiết
  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
