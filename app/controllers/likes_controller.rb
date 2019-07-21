class LikesController < ApplicationController
  before_action :set_fabric, only: %i[create destroy]
  before_action :set_like, only: %i[destroy]

  def create
    @like = current_buyer.likes.build(fabric: @fabric)
    if @like.save
      render :save
    else
      render :save_error
    end
  end

  def destroy
    if @like.destroy
      render :save
    else
      render :save_error
    end
  end

  private

  def set_fabric
    @fabric = Fabric.find(params[:fabric_id])
  end

  def set_like
    @like = current_buyer.likes.find(params[:id])
  end
end
