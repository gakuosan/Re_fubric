# Preview all emails at http://localhost:3000/rails/mailers/seller_mailer
class SellerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/seller_mailer/account_activation
  def account_activation
    SellerMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/seller_mailer/password_reset
  def password_reset
    SellerMailer.password_reset
  end

end
