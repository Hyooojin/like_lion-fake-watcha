class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # 모든 서비스를 사용 전에 로그인하세요
  before_action :authenticate_user!
  
end
