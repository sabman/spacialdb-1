class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index
  respond_to :html

  def index
    @plans = Plan.all.order(:id)
    respond_with(@plans)
  end
end
