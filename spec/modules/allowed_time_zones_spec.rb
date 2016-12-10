require "rails_helper"

describe AllowedTimeZones, type: :module do
  it "renders a time zone" do
    expect(described_class::CENTRAL).to eq "Central Time (US & Canada)"
  end

  it "returns a list of all time zones" do
    expect(described_class.all).to include "Alaska", "Central Time (US & Canada)", "Eastern Time (US & Canada)"
  end
end
