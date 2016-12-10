require "rails_helper"

feature "home page", type: :feature, js: true do
  scenario "User visits the home page on production" do
    visit root_path

    expect(page).to have_content "This is the home page"
    expect(page).to have_title "#{AppSettings.brand_name} | Home"

    desc_text = "This is a description"
    desc_tag = "meta[name=\"description\"][content=\"#{desc_text}\"]"
    expect(page).to have_css(desc_tag, visible: false)

    desc_text = "Dogs, birds, cats, fish"
    desc_tag = "meta[name=\"keywords\"][content=\"#{desc_text}\"]"
    expect(page).to have_css(desc_tag, visible: false)
  end
end
