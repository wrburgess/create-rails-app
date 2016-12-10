require "rails_helper"

describe "checking basic stability of app", type: :feature, js: true do
  let(:user) { FactoryGirl.create :user }

  def log_in_with(email, password)
    visit new_user_session_path
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Sign in"
  end

  describe "by visiting pages" do
    it "visits the home page and is redirected to the sign_in page" do
      visit root_path
      expect(page.source).to have_css "body.static.home"
    end

    xit "by visiting the 'secure' page as an authenticated user" do
      log_in_with user.email, user.password
      visit secure_path
      expect(page.source).to have_css "body.static.secure"
    end
  end
end
