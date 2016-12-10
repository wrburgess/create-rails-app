require "rails_helper"

describe TestMailer do
  describe "send" do
    let(:message) { described_class.send_mail }
    let(:subject_line) { "Test email from CreateRailsApp #{Rails.env}" }
    let(:sender_email) { AppSettings.no_reply_email }
    let(:recipient_email) { "wrburgess@gmail.com" }

    it "renders the subject" do
      expect(message.subject).to include subject_line
    end

    it "renders the receiver email" do
      expect(message.to).to eq [recipient_email]
    end

    it "renders the sender email" do
      expect(message.from).to eq [sender_email]
    end
  end

  describe "delay" do
    it "sends delayed emails to sidekiq queue" do
      expect { described_class.delay.send }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by 1
    end
  end
end
