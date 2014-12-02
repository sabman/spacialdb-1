class InstancesController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_instance, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @instances = current_user.all
    respond_with(@instances)
  end

  def create
    @instance = current_user.instances.create(instance_params)
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
