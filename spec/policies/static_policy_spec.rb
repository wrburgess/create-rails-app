require "rails_helper"

describe StaticPolicy, type: :policy do
  subject { described_class.new(user, :static) }

  context "for a unauthorized user" do
    let(:user) { nil }
    it { is_expected.to permit_action(:about) }
    it { is_expected.to permit_action(:contact) }
    it { is_expected.to permit_action(:home) }
    it { is_expected.to permit_action(:robots) }
    it { is_expected.to forbid_action(:secure) }
  end

  context "for an authorized user" do
    let(:user) { FactoryGirl.create(:user) }
    it { is_expected.to permit_action(:about) }
    it { is_expected.to permit_action(:contact) }
    it { is_expected.to permit_action(:home) }
    it { is_expected.to permit_action(:robots) }
    it { is_expected.to permit_action(:secure) }
  end
end
