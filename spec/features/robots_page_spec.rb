require "rails_helper"

feature "robots.txt page", type: :feature, js: false do
  scenario "User visits the robots page on production" do
    allow(Rails.env).to receive(:production?).and_return(true)
    visit robots_path format: :text

    expect(page).to have_content "User-Agent: *"
    expect(page).not_to have_content "Allow: /"
    expect(page).to have_content "Disallow: /"

    # TODO: The production environment should allow spiders
    # expect(page).to have_content "User-Agent: *"
    # expect(page).to have_content "Allow: /"
    # expect(page).to have_content "Disallow: /admin"
  end

  scenario "User visits the robots page not on production" do
    allow(Rails.env).to receive(:production?).and_return(false)
    visit robots_path format: :text

    expect(page).to have_content "User-Agent: *"
    expect(page).not_to have_content "Allow: /"
    expect(page).to have_content "Disallow: /"
  end
end
