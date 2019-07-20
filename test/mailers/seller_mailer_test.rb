require 'test_helper'

class SellerMailerTest < ActionMailer::TestCase

  test "account_activation" do
    seller = sellers(:gakuchan)
    seller.activation_token = Seller.new_token
    mail = SellerMailer.account_activation(seller)
    assert_equal "Account activation", mail.subject
    assert_equal [seller.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match seller.name,               mail.body.encoded
    assert_match seller.activation_token,   mail.body.encoded
    assert_match CGI.escape(seller.email),  mail.body.encoded
  end

  test "password_reset" do
    seller = sellers(:manabu)
    seller.reset_token = Seller.new_token
    mail = SellerMailer.password_reset(seller)
    assert_equal "Password reset", mail.subject
    assert_equal [seller.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match seller.reset_token,        mail.body.encoded
    assert_match CGI.escape(buyer.email),  mail.body.encoded
  end

end
