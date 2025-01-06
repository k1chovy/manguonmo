class ApplicationController < ActionController::Base
  include Authentication

  before_action :require_login

  private

  def require_login
    Rails.logger.info "require_login: session[:user_id] = #{session[:user_id]}, path = #{request.path}"

    # Nếu người dùng đã đăng nhập hoặc truy cập vào các route login/session
    if session[:user_id]
      Rails.logger.info "User already logged in"
    elsif controller_name == "sessions" && action_name.in?(["new", "create"])
      Rails.logger.info "Skipping redirect for session actions to avoid loop"
    else
      redirect_to login_path, alert: "Vui lòng đăng nhập để tiếp tục."
    end
  end
end
