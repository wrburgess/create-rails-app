require "rails_helper"

feature "internal_server_error page", type: :feature, js: false do
  scenario "User visits the internal_server_error on production" do
    visit internal_server_error_path

    expect(page).to have_content "This is the Internal Server Error (500) page"
    expect(page).to have_title "Internal Server Error (500) | #{AppSettings.brand_name}"

    desc_text = AppSettings.default_page_description
    desc_tag = "meta[name=\"description\"][content=\"#{desc_text}\"]"
    expect(page).to have_css(desc_tag, visible: false)

    desc_text = AppSettings.default_page_keywords
    desc_tag = "meta[name=\"keywords\"][content=\"#{desc_text}\"]"
    expect(page).to have_css(desc_tag, visible: false)
  end
end
