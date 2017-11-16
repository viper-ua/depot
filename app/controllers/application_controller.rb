class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  before_action :authorize

  protected

    def authorize
      unless (session[:user_id] == 0 && User.count == 0) || User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
