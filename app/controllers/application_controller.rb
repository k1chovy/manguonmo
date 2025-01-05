class ApplicationController < ActionController::Base
  include Authentication

  before_action :require_login

  private

  def require_login
    Rails.logger.info "require_login: session[:user_id] = #{session[:user_id]}, path = #{request.path}"
    unless session[:user_id]
      # Tránh vòng lặp nếu đang truy cập trang login
      if request.path == login_path || request.path == new_session_path
        Rails.logger.info "Skipping redirect for login page to avoid loop"
        return
      end
      redirect_to login_path, alert: "Vui lòng đăng nhập để tiếp tục."
    end
  end
end
