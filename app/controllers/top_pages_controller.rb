class TopPagesController < ApplicationController
  before_action :set_top_page, only: [:show, :edit, :update, :destroy]

  # GET /top_pages
  # GET /top_pages.json
  def index
    @top_pages = TopPage.all
  end

  # GET /top_pages/1
  # GET /top_pages/1.json
  def show
  end

  # GET /top_pages/new
  def new
    @top_page = TopPage.new
  end

  # GET /top_pages/1/edit
  def edit
  end

  # POST /top_pages
  # POST /top_pages.json
  def create
    @top_page = TopPage.new(top_page_params)

    respond_to do |format|
      if @top_page.save
        format.html { redirect_to @top_page, notice: 'Top page was successfully created.' }
        format.json { render :show, status: :created, location: @top_page }
      else
        format.html { render :new }
        format.json { render json: @top_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /top_pages/1
  # PATCH/PUT /top_pages/1.json
  def update
    respond_to do |format|
      if @top_page.update(top_page_params)
        format.html { redirect_to @top_page, notice: 'Top page was successfully updated.' }
        format.json { render :show, status: :ok, location: @top_page }
      else
        format.html { render :edit }
        format.json { render json: @top_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top_pages/1
  # DELETE /top_pages/1.json
  def destroy
    @top_page.destroy
    respond_to do |format|
      format.html { redirect_to top_pages_url, notice: 'Top page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top_page
      @top_page = TopPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_page_params
      params.fetch(:top_page, {})
    end
end
