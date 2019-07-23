class Buyers::AccountController < ApplicationController
  skip_before_action :logged_in_buyer

　def edit
    buyer = Buyer.find_by(email: params[:email])
    if buyer && !buyer.activated? && buyer.authenticated?(:activation, params[:id])
      buyer.activate
      log_in buyer
      redirect_to root_path, notice: 'アカウントが有効になりました'
    else
      redirect_to login_path, alert: 'リンクが無効です'
    end
  end
end
