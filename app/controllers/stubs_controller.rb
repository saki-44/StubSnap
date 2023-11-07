class StubsController < ApplicationController
  def index
    @stubs = Stub.where(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end
end
