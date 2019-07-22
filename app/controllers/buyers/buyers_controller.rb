class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :edit, :update, :destroy]
　LIKED_REQUEST = 'liked'
  # GET /buyers
  # GET /buyers.json
  def index
    @buyers = Buyer.all
  end

  def search
    @q = Fabric.search(search_params)
    @fabrics = @q.result(distinct: true)
  end

  # GET /buyers/1
  # GET /buyers/1.json
  def show
    @buyer = Buyer.find(params[:id])
  end

  def new
    @buyer = Buyer.new
  end

  # GET /buyers/1/edit
  def edit
  end

  # POST /buyers
  # POST /buyers.json
  def create
    @buyer = Buyer.new(buyer_params)

    respond_to do |format|
      if @buyer.save
        format.html { redirect_to @buyer, notice: 'Buyer was successfully created.' }
        format.json { render :show, status: :created, location: @buyer }
      else
        format.html { render :new }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyers/1
  # PATCH/PUT /buyers/1.json
  def update
    respond_to do |format|
      if @buyer.update(buyer_params)
        format.html { redirect_to @buyer, notice: 'Buyer was successfully updated.' }
        format.json { render :show, status: :ok, location: @buyer }
      else
        format.html { render :edit }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyers/1
  # DELETE /buyers/1.json
  def destroy
    @buyer.destroy
    respond_to do |format|
      format.html { redirect_to buyers_url, notice: 'Buyer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def buyer_params
      params.require(:buyer).permit(:name, :email, :profile_image, :password, :password_confirmation)
    end
    end

    def create_activation_digest
      # 有効化トークンとダイジェストを作成および代入する
    end

    def search_params
     params.require(:q).permit!
    end
