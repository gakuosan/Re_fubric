class FabricsController < ApplicationController
  PER = 10
  before_action :set_fabric, only: [:show, :edit, :update, :destroy]

  # GET /fabrics
  # GET /fabrics.json
def index
   @q = Fabric.ransack(params[:q])
   #@fabrics = Fabrics.all
   #JSonとAPIの使用
   @fabrics = Fabric.page(params[:page]).per(PER)
   respond_to do |format|
     format.html
     format.js
   #Ransackのコード
   @fabrics = @q.result.includes(:department, :subjects)
   end
end

  # GET /fabrics/1
  # GET /fabrics/1.json
  def show
      @fabric = Fabric.find(params[:id])
  end

  # GET /fabrics/new
  def new
    @fabric = Fabric.new
  end

  # GET /fabrics/1/edit
  def edit
  end

  # POST /fabrics
  # POST /fabrics.json
  def create
    @fabric = Fabric.new(fabric_params)

    ##########  end

  # PATCH/PUT /fabrics/1
  # PATCH/PUT /fabrics/1.json
  def update
    respond_to do |format|
      if @fabric.update(fabric_params)
        format.html { redirect_to @fabric, notice: 'Fabric was successfully updated.' }
        format.json { render :show, status: :ok, location: @fabric }
      else
        format.html { render :edit }
        format.json { render json: @fabric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fabrics/1
  # DELETE /fabrics/1.json
  def destroy
    @fabric.destroy
    respond_to do |format|
      format.html { redirect_to fabrics_url, notice: 'Fabric was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fabric
      @fabric = Fabric.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fabric_params
      params.require(:fabric).permit(:fabric_color, :fabric_weight, :fabric_yarn_count, :fabric_knitting_way, :fabric_price, :fabric_composition, :fabric_id, :fabric_count, :image,  :image_cache)
    end

   def search_params
     params.require(:q).permit(:color_cont)
end
end
end
