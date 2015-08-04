class InstancesController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_instance, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @instances = current_user.instances.all
    respond_with(@instances)
  end

  def show
  end

  def new
    @instance = Instance.new
    @plans = Plan.all
    @plan = Plan.find_by_id(params[:plan]) || @plans.first
    @regions = Region.order(:slug)
    respond_with(@instance, @plans)
  end

  def create
    logger.info instance_params
    params.permit!.merge(
      stripe_token: instance_params[:stripeToken]
    )

    @instance = current_user.instances.new(instance_params)
    @instance.subscription = CreateSubscription.call(params)
    @instance.save
    respond_with(@instance)
  end

  private
    def set_instance
      @instance = current_user.instances.find(params[:id])
    end

    def instance_params
      params[:instance]
    end
end
