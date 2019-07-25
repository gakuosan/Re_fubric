class Sellers::SessionsController< ApplicationController
  #skip_before_action :logged_in_seller, only: %i[new create]


  def new
  end

  def create
    seller = Seller.find_by(email: params[:session][:email])
    if seller && seller.authenticate(params[:session][:password])
      if seller.activated?
        log_in seller
        params[:session][:remember_me] == '1' ? remember(seller) : forget(seller)
        redirect_back_or root_path
      else
        message = 'アカウントがアクティブになっていません。'
        message += '招待メールを確認してください'
        redirect_to log_in_path, alert: message
      end
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが正しくありません'
      render :new
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to log_in_path
  end
end
