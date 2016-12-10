class ApplicationMailer < ActionMailer::Base
  default from: AppSettings.no_reply_email
  layout "mailer"
end
