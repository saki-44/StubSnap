class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to stubs_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, success: t('.success')
  end

  def guest_login
    redirect_to root_path, alert: 'すでにログインしています' if current_user

    @user = User.find_by(email: 'guest@example.com')
    auto_login(@user)
    flash[:success] = 'ゲストユーザーでログインしました'
    redirect_to stubs_path
  end
end
