class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top about info]

  def top; end

  def about; end

  def info; end
end
