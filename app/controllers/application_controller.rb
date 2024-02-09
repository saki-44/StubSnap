class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to login_path
  end

  private

  def login_as_regular_user
    return unless current_user&.email == 'guest@example.com'

    flash[:danger] = 'ゲストユーザーでは操作できません'
    redirect_back_or_to stubs_path
  end
end
