class BuyerMailer < ApplicationMailer
  def account_activation(buyer)
    @buyer = buyer
    mail to: buyer.email, subject: '[Refabric]メールアドレス確認メール'
  end

  def password_reset(buyer)
    @buyer = buyer
    mail to: buyer.email, subject: '[Refabric]パスワードの再設定について'
  end
end
