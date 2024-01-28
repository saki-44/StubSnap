class LikesController < ApplicationController
  before_action :set_stub, only: %i[create destroy]
  before_action :login_as_regular_user

  def create
    @stub.likes.create(user: current_user)
    respond_to(&:turbo_stream)
  end

  def destroy
    @like = @stub.likes.find_by(user: current_user)
    @like.destroy
    respond_to(&:turbo_stream)
  end

  private

  def set_stub
    @stub = Stub.find(params[:stub_id])
  end
end
