class ApplicationController < ActionController::Base
  include Authentication

  before_action :require_login

  private

  def require_login
    Rails.logger.info "require_login: session[:user_id] = #{session[:user_id]}, path = #{request.path}"

    if session[:user_id]
      Rails.logger.info "Người dùng đã đăng nhập: user_id=#{session[:user_id]}"
    elsif exempted_paths.include?(request.path)
      Rails.logger.info "Bỏ qua kiểm tra đăng nhập cho path: #{request.path}"
    else
      Rails.logger.warn "Chuyển hướng đến trang đăng nhập từ path: #{request.path}"
      redirect_to login_path, alert: "Vui lòng đăng nhập để tiếp tục."
    end
  end

  # Các đường dẫn không yêu cầu đăng nhập
  def exempted_paths
    [
      login_path,
      new_session_path,
      new_user_path,      # Đăng ký tài khoản
      new_password_path,  # Yêu cầu đặt lại mật khẩu
    ]
  end
end
