module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(buyer)                                                              # login_inメソッドにuser(ログイン時にユーザーが送ったメールとパス)を引数として渡す
    session[:buyer_id] = buyer.id                                                 # ユーザーidをsessionのuser_idに代入（ログインidの保持）
  end

  # 渡されたユーザーでログインする
  def log_in(seller)                                                              # login_inメソッドにuser(ログイン時にユーザーが送ったメールとパス)を引数として渡す
    session[:seller_id] = seller.id                                                 # ユーザーidをsessionのuser_idに代入（ログインidの保持）
  end

end
