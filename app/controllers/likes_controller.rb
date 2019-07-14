class LikesController < ApplicationController
  def create
    @fabric = Fabric.find(params[:fabric_id])
    @like = current_buyer.likes.new(fabric: @fabric)
    if @like.save
      render :save
    end
  end

  def destroy
    @fabric = Fabric.find(params[:fabric_id])
    @like = current_buyer.likes.find(params[:id])
    if @like.destroy
      render :save
    end
  end
end
