class SubscriptionsController < ApplicationController
  before_filter :find_plan_and_quantity, only: [:create]

  def create
    params.permit!.merge(
      :plan => @plan,
      quantity: @quantity
    )

    CreateSubscription.call(params)
  end

  private
    def find_plan_and_quantity
      @plan = Plan.find_by!(id: params[:plan_id])
      @quantity = params[:quantity].blank? ? 1 : params[:quantity].to_i
    end
end
