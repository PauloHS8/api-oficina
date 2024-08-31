class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      render :index_admin
    else
      render :index_cliente
    end
  end
end
