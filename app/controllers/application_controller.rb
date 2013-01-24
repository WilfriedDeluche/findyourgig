class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_i18n_from_headers
  before_filter :set_i18n_locale_from_params
  before_filter :current_user_roles

  def set_i18n_from_headers
    unless params[:locale] || request.fullpath != "/"
      if request.env['HTTP_ACCEPT_LANGUAGE'].blank?
        redirect_to "/#{I18n.default_locale}"
      else
        browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
        if I18n.available_locales.include?(browser_locale.to_sym)
          redirect_to "/#{browser_locale}"
        else
          redirect_to "/#{I18n.default_locale}"
        end
      end
    end
  end

  def set_i18n_locale_from_params
    I18n.locale = params[:locale] if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
  end

  def default_url_options
    { :locale => I18n.locale }
  end

  def current_user_roles
    @current_user_roles = user_signed_in? ? current_user.roles_list : []
  end
end
