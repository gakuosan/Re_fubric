class Sellers::PasswordResetsController < ApplicationController
  skip_before_action :logged_in_seller
  before_action :set_seller,   only: %i[edit update]
  before_action :valid_seller, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update]

  def new
  end

  def create
    @seller = Seller.find_by(email: params[:password_reset][:email].downcase)
    if @seller
      @seller.create_reset_digest
      @seller.send_password_reset_email
      redirect_to new_password_reset_path, notice: '入力したメールアドレスにパスワード再設定メールを送りました'
    else
      flash.now[:alert] = 'メールアドレスが見つかりません'
      render :new
    end
  end

  def edit
  end

  def update
    if params[:seller][:password].empty?
      @seller.errors.add(:password, :blank)
      render :edit
    elsif @seller.update_attributes(user_params)
      log_in @seller
      redirect_to root_path, notice: 'パスワードが再設定されました'
    else
      render :edit
    end
  end

  def update
    if params[:user][:password].empty?
      @seller.errors.add(:password, :blank)
      render :edit
    elsif @seller.update_attributes(user_params)
      log_in @seller
      redirect_to root_path, notice: 'パスワードが再設定されました'
    else
      render :edit
    end
  end


  private

  def seller_params
    params.require(:seller).permit(:password, :password_confirmation)
  end

  def set_seller
    @seller = Seller.find_by(email: params[:email] || params.dig(:seller, :email))
  end



  def valid_seller
    if not (@seller && @seller.activated? &&
        @seller.authenticated?(:reset, params[:id]))
      redirect_to login_path, alert: 'ユーザが見つかりません'
    end
  end

  def check_expiration
    if @PasswordResetsController.password_reset_expired?
      redirect_to new_password_reset_url, alert: 'パスワード再設定の有効期限がきれています'
    end
  end
end
