class StubsController < ApplicationController
  before_action :find_stub, only: [:edit, :update, :destroy]

  def index
    @stubs = Stub.published.includes(:user).order(created_at: :desc)
  end

  def new
    @stub = Stub.new
    @categories = Category.all
  end

  def create
    @stub = current_user.stubs.build(stub_params)
    @categories = Category.all
    if @stub.save
      redirect_to my_page_stubs_path, success: t('defaults.message.created', item: Stub.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Stub.model_name.human)
      render :new
    end
  end

  def show
    @stub = Stub.find(params[:id])
  end

  def edit
    @categories = Category.all
  end

  def update
    if @stub.update(stub_params)
      redirect_to @stub, success: t('defaults.message.updated', item: Stub.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Stub.model_name.human)
      render :edit
    end
  end

  def destroy
    @stub.destroy!
    redirect_back_or_to my_page_stubs_path, status: :see_other, success: t('defaults.message.deleted', item: Stub.model_name.human)
  end

  def my_page
    @stubs = current_user.stubs.includes(:user).order(created_at: :desc)
    render :index
  end

  def my_liking
    @stubs = current_user.likes.includes(:stub, :user).order(created_at: :desc).map(&:stub)
    render :index
  end

  private

  def stub_params
    params.require(:stub).permit(:title, :address, :memo, :status, :category_id, :stub_image, :stub_image_cache, :date)
  end

  def find_stub
    @stub = current_user.stubs.find(params[:id])
  end
end
