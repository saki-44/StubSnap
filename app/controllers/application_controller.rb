class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to login_path
  end

  def login_as_regular_user
    redirect_to stubs_path, alert: 'ゲストユーザーでは操作できません' unless current_user
  end
end
