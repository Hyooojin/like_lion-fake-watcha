class Admin::ApplicationController < ApplicationController
  before_action :check_admin
  layout 'admin'
  private
  def check_admin
    # 지금 접속한 친구가 관리자인지 판별
    # 아닐 경우 루트페이지

    unless user_signed_in? && current_user.admin? # 두개다 맞아야 한다.
      redirect_to(root_path, alert: "관리자 계정으로 로그인하셔야 합니다.")
    end

  end
end
