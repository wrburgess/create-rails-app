require "rails_helper"

describe ApplicationHelper, type: :helper do
  describe "page_head_title" do
    xit "returns the page title with the brand name attached if title submitted" do
      # helper.page_head_title("test")
      # expect(helper.instance_variable_get('@content_for_title')).to eq "test1"

      # assign(:title, "My Title")
      # helper.(page_head_title("My Title")).should eql("My Title")
    end

    xit "returns the brand name for page title if no title present" do
      expect(helper.title).to eq AppSettings.brand_name
    end
  end

  describe "page_meta_keywords" do
    xit "returns the page keywords if keywords submitted" do
      expect(page_meta_keywords("test")).to eq "test | #{AppSettings.brand_name}"
    end

    xit "returns the default page keywords if no keywords submitted" do
      expect(page_meta_keywords(nil)).to eq AppSettings.brand_name
    end
  end

  describe "page_meta_desc" do
    xit "returns the page description if description submitted" do
      expect(page_meta_desc("test")).to eq "test | #{AppSettings.brand_name}"
    end

    xit "returns the default page description if no description submitted" do
      expect(page_meta_desc(nil)).to eq AppSettings.brand_name
    end
  end

  describe "#copyright_notice" do
    it "renders the year 2016 in the Copyright notice" do
      expect(copyright_notice).to eq "&copy; 2016 #{AppSettings.brand_name}"
    end
  end

  describe "#number_with_leading" do
    it "coverts integer into string with leading zero if necessary" do
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].each do |num|
        expect(number_with_leading(num)).to eq "0#{num}"
      end
    end

    it "does not covert multi-digit integers to strings with leading zero" do
      [10, 100, 20_000, 300_000].each do |num|
        expect(number_with_leading(num)).to eq num.to_s
      end
    end
  end
end
