class UsersController < ApplicationController
  # Hiển thị danh sách người dùng
  def index
    @users = User.all
  end

  # Hiển thị form đăng ký
  def new
    @user = User.new
  end

  # Xử lý đăng ký người dùng mới
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Đăng ký thành công!"
      redirect_to login_path
    else
      render :new
    end
  end

  # Xóa tài khoản người dùng
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Tài khoản đã được xóa thành công!"
    else
      flash[:alert] = "Không thể xóa tài khoản!"
    end
    redirect_to users_path
  end

  private

  # Các tham số hợp lệ cho việc tạo người dùng
  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
