def index
  page = params[:page] || '1'

  limit = 10
  offset = (page.to_i - 1) * limit

  # limit, offset を受け取り、リストと最大件数を返すような API にリクエスト
  @fabrics, pagination = request_external_api(limit, offset)
  #@items, pagination = request_external_api(limit, offset)
  total = pagination['total']

  @fabrics = Kaminari.paginate_array(@fabrics, total_count: total).page(page).per(limit)
  #@items = Kaminari.paginate_array(@fabrics, total_count: total).page(page).per(limit)
end
