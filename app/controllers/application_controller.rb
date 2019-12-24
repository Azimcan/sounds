class ApplicationController < ActionController::Base
  helper_method :signed_in?, :current_user, :login
  # before_action :set_locale

  private

  def login(user)
    session[:user_id] = user.id
  end

  # Giris yapmis olan kullanici nesnesini dondurur
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user
  end

  def allowed?
    redirect_to root_path, alert: 'Bunu yapmaya yetkiniz yok.' if current_user.nil?
  end
end
