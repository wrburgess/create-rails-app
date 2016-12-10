class TestMailer < ApplicationMailer
  def send_mail
    mail(
      to: "wrburgess@gmail.com",
      subject: "Test email from CreateRailsApp #{Rails.env}",
      template_path: "mailers",
      template_name: "test"
    )
  end
end
