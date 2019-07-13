module SessionsHelper

  def current_buyer
    if (buyer_id = session[:buyer_id])
    # 一時的なセッションユーザーがいる場合処理を行い、user_idに代入
    @current_buyer ||= Buyer.find_by(id: user_id)
    # 現在のユーザーがいればそのまま、いなければsessionユーザーidと同じidを持つユーザーをDBから探して@current_user（現在のログインユーザー）に代入
    elsif (buyer_id = cookies.signed[:buyer_id])
    # user_idを暗号化した永続的なユーザーがいる（cookiesがある）場合処理を行い、user_idに代入
    buyer = Buyer.find_by(id: buyer_id)
    # 暗号化したユーザーidと同じユーザーidをもつユーザーをDBから探し、userに代入
    if byer && buyer.authenticated?(cookies[:remember_token])
    # DBのユーザーがいるかつ、受け取った記憶トークンをハッシュ化した記憶ダイジェストを持つユーザーがいる場合処理を行う
    log_in buyer
    # 一致したユーザーでログインする
    @current_buyer = buyer
    # 現在のユーザーに一致したユーザーを設定
    end
  end

  def current_seller
    if (seller_id = session[:seller_id])
    # 一時的なセッションユーザーがいる場合処理を行い、user_idに代入
    @current_seller ||= Seller.find_by(id: seller_id)
    # 現在のユーザーがいればそのまま、いなければsessionユーザーidと同じidを持つユーザーをDBから探して@current_user（現在のログインユーザー）に代入
      elsif (seller_id = cookies.signed[:seller_id])
    # user_idを暗号化した永続的なユーザーがいる（cookiesがある）場合処理を行い、user_idに代入
      seller = Seller.find_by(id: seller_id)
    # 暗号化したユーザーidと同じユーザーidをもつユーザーをDBから探し、userに代入
      if seller && seller.authenticated?(cookies[:remember_token])
    # DBのユーザーがいるかつ、受け取った記憶トークンをハッシュ化した記憶ダイジェストを持つユーザーがいる場合処理を行う
      log_in seller
    # 一致したユーザーでログインする
      @current_seller = seller
    # 現在のユーザーに一致したユーザーを設定
      end
    end
   end
  end
end
