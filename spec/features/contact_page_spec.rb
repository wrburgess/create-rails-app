require "rails_helper"

feature "contact page", type: :feature, js: true do
  scenario "User visits the contact page on production" do
    visit contact_path

    expect(page).to have_content "This is the contact page"
    expect(page).to have_title "Contact | #{AppSettings.brand_name}"

    desc_text = AppSettings.default_page_description
    desc_tag = "meta[name=\"description\"][content=\"#{desc_text}\"]"
    expect(page).to have_css(desc_tag, visible: false)

    desc_text = AppSettings.default_page_keywords
    desc_tag = "meta[name=\"keywords\"][content=\"#{desc_text}\"]"
    expect(page).to have_css(desc_tag, visible: false)
  end
end
