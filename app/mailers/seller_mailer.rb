class SellerMailer < ApplicationMailer

  def account_activation(seller)
    @seller = seller
    mail to: seller.email, subject: "Account activation"
  end

  def password_reset(seller)
    @seller = seller
    mail to: seller.email, subject: "Password reset"
  end
end
