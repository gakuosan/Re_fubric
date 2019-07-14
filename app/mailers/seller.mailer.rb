class SellerMailer < ApplicationMailer
  def account_activation(seller)
    @seller = seller
    mail to: seller.email, subject: '[ReFabric]メールアドレス確認メール'
  end

  def password_reset(user)
    @seller = seller
    mail to: seller.email, subject: '[Refabric]パスワードの再設定について'
  end
end
