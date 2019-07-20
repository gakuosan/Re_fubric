require 'test_helper'

class BuyerMailerTest < ActionMailer::TestCase

  test "account_activation" do
    buyer = buyers(:gakuchan)
    buyer.activation_token = Buyer.new_token
    mail = BuyerMailer.account_activation(buyer)
    assert_equal "Account activation", mail.subject
    assert_equal [buyer.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match buyer.name,               mail.body.encoded
    assert_match buyer.activation_token,   mail.body.encoded
    assert_match CGI.escape(buyer.email),  mail.body.encoded
  end

  test "password_reset" do
    buyer = buyers(:manabbcchi)
    buyer.reset_token = Buyer.new_token
    mail = BuyerMailer.password_reset(buyer)
    assert_equal "Password reset", mail.subject
    assert_equal [buyer.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match buyer.reset_token,        mail.body.encoded
    assert_match CGI.escape(buyer.email),  mail.body.encoded
  end

end
