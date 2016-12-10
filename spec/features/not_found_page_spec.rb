require "rails_helper"

feature "not_found page", type: :feature, js: false do
  scenario "User visits the not_found on production" do
    visit not_found_path

    expect(page).to have_content "This is the Not Found (404) page"
    expect(page).to have_title "Not Found (404) | #{AppSettings.brand_name}"

    desc_text = AppSettings.default_page_description
    desc_tag = "meta[name=\"description\"][content=\"#{desc_text}\"]"
    expect(page).to have_css(desc_tag, visible: false)

    desc_text = AppSettings.default_page_keywords
    desc_tag = "meta[name=\"keywords\"][content=\"#{desc_text}\"]"
    expect(page).to have_css(desc_tag, visible: false)
  end
end
