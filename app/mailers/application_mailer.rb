class ApplicationMailer < ActionMailer::Base
  # 送信元（from）の設定
  default from: 'test_leader@example.com'
  layout 'mailer'
end
