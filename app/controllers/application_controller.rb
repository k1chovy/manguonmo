class ApplicationController < ActionController::Base
  include Authentication

  before_action :require_login

  private

  def require_login
    unless session[:user_id]
      redirect_to new_session_path, alert: "Vui lòng đăng nhập để tiếp tục."
    end
  end
end
