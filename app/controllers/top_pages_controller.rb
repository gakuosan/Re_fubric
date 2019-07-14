class HomeController < ApplicationController

  def index
    @q = Fabrics.includes(buyer).order(created_at: :desc, id: :desc).search(params[:q])
    @fabrics = @q.result.page(params[:page])
  end
end
