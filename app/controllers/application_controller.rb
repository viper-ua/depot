class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  before_action :authorize
  before_action :set_i18n_locale_from_params

  protected

    def authorize
      unless (session[:user_id] == 0 && User.count == 0) || User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

end
