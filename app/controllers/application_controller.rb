class ApplicationController < ActionController::Base
  include Authentication

  before_action :require_login

  private

  def require_login
    Rails.logger.info "require_login: session[:user_id] = #{session[:user_id]}, path = #{request.path}"

    # Kiểm tra nếu đã đăng nhập hoặc truy cập vào trang đăng nhập
    if session[:user_id]
      Rails.logger.info "User already logged in"
    elsif request.path == login_path || request.path == new_session_path
      Rails.logger.info "Skipping redirect to avoid loop"
    else
      redirect_to login_path, alert: "Vui lòng đăng nhập để tiếp tục."
    end
  end
end
