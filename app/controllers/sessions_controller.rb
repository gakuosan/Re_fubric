class SessionsController < ApplicationController
  def new
  end

  def create
    Buyer = Buyer.find_by(email: params[:session][:email].downcase)
    # paramsハッシュで受け取ったemail値を小文字化し、email属性に渡してBuyerモデルから同じemailの値のBuyerを探して、buyer変数に代入
    if buyer && buyer.authenticate(params[:session][:password])
      # buyer変数がデータベースに存在し、なおかつparamsハッシュで受け取ったpassword値と、buyerのemail値が同じ(パスワードとメールアドレスが同じ値であれば)true
    else
      flash.now[:danger] = "メールアドレスが間違えてます"
      # flashメッセージを表示し、新しいリクエストが発生した時に消す
      render 'new'
      # newビューの出力
    end
  end

  def create
    seller = Seller.find_by(email: params[:session][:email].downcase)
    # paramsハッシュで受け取ったemail値を小文字化し、email属性に渡してUserモデルから同じemailの値のSellerを探して、seller変数に代入
    if seller && seller.authenticate(params[:session][:password])
       # seller変数がデータベースに存在し、なおかつparamsハッシュで受け取ったpassword値と、sellerのemail値が同じ(パスワードとメールアドレスが同じ値であれば)true
    else
      flash.now[:danger] = "メールアドレスが間違えてます"
      # flashメッセージを表示し、新しいリクエストが発生した時に消す
      render 'new'
      # newビューの出力
    end
  end

  def destroy
  log_out
   # ログアウトする
  redirect_to root_url
   # homeへ移動
end

end
