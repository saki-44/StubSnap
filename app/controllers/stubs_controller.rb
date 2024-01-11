class StubsController < ApplicationController
  def index
    @stubs = Stub.where(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end

  def new
    @stub = Stub.new
    @categories = Category.all
  end

  def create
    @stub = current_user.stubs.build(stub_params)
    @categories = Category.all
    if @stub.save
      redirect_to stubs_path, success: t('defaults.message.created', item: Stub.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Stub.model_name.human)
      render :new
    end
  end

  def show
    @stub = Stub.find(params[:id])
  end

  private

  def stub_params
    params.require(:stub).permit(:title, :address, :memo, :public, :category_id, :stub_image, :stub_image_cache)
  end
end
