require "rails_helper"

feature "User visits the Secure page", type: :feature, js: false do
  let(:user) { FactoryGirl.create :user }

  scenario "without authentication" do
    visit secure_path

    expect(page).to have_content "This is the home page"
  end

  scenario "with authentication" do
    login_as(user, scope: :user)
    visit secure_path

    expect(page).to have_content "Only an authenticated user should see this."
  end
end
