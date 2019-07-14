class ApplicationController < ActionController::Base
  before_action :set_search

def set_search
  @search = Fabric.ransack(params[:q])
  #ransackメソッド推奨
  #@search_fabrics = @search.result.page(params[:page])
end
end
