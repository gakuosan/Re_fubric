# Preview all emails at http://localhost:3000/rails/mailers/buyer_mailer
class BuyerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/buyer_mailer/account_activation
  def account_activation
    BuyerMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/buyer_mailer/password_reset
  def password_reset
    BuyerMailer.password_reset
  end

end
