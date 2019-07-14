class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com', reply_to: 'support@refabric.jp'
  layout 'mailer'
end
