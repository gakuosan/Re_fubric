class Buyers::PasswordResetsController < ApplicationController
  skip_before_action :logged_in_buyer
  before_action :set_buyer,   only: %i[edit update]
  before_action :valid_buyer, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update]

  def new
  end

  def create
    @buyer = Buyer.find_by(email: params[:password_reset][:email].downcase)
    if @buyer
      @buyer.create_reset_digest
      @buyer.send_password_reset_email
      redirect_to new_password_reset_path, notice: '入力したメールアドレスにパスワード再設定メールを送りました'
    else
      flash.now[:alert] = 'メールアドレスが見つかりません'
      render :new
    end
  end

  def edit
  end

  def update
    if params[:nuyer][:password].empty?
      @buyer.errors.add(:password, :blank)
      render :edit
    elsif @buyer.update_attributes(user_params)
      log_in @buyer
      redirect_to root_path, notice: 'パスワードが再設定されました'
    else
      render :edit
    end
  end

  def update
    if params[:user][:password].empty?
      @buyer.errors.add(:password, :blank)
      render :edit
    elsif @buyer.update_attributes(user_params)
      log_in @buyer
      redirect_to root_path, notice: 'パスワードが再設定されました'
    else
      render :edit
    end
  end


  private

  def buyer_params
    params.require(:buyer).permit(:password, :password_confirmation)
  end

  def set_buyer
    @buyer = Buyer.find_by(email: params[:email] || params.dig(:buyer, :email))
  end



  def valid_buyer
    if not (@buyer && @buyer.activated? &&
        @buyer.authenticated?(:reset, params[:id]))
      redirect_to login_path, alert: 'ユーザが見つかりません'
    end
  end

  def check_expiration
    if @PasswordResetsController.password_reset_expired?
      redirect_to new_password_reset_url, alert: 'パスワード再設定の有効期限がきれています'
    end
  end
end
