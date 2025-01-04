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
      flash[:notice] = "Đăng ký tài khoản mới thành công!"
      redirect_to login_path
    else
      flash[:alert] = "Đăng ký thất bại! Vui lòng kiểm tra lại thông tin."
      render :new
    end
  end

  # Hiển thị form chỉnh sửa người dùng
  def edit
    @user = User.find(params[:id])
  end

  # Xử lý cập nhật thông tin người dùng
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Tài khoản của bạn đã được cập nhật thành công!"
      redirect_to users_path
    else
      flash[:alert] = "Cập nhật tài khoản thất bại! Vui lòng kiểm tra lại thông tin."
      render :edit
    end
  end
  def show
    @user = User.find(params[:id])
  end
  

  # Xóa tài khoản người dùng
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Tài khoản đã được xóa thành công!"
    else
      flash[:alert] = "Không thể xóa tài khoản! Vui lòng thử lại sau."
    end
    redirect_to users_path
  end

  private

  # Các tham số hợp lệ cho việc tạo hoặc cập nhật người dùng
  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
