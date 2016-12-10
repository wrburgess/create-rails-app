require "rails_helper"

describe ErrorsPolicy, type: :policy do
  subject { described_class.new(user, :errors) }

  context "for a unauthorized user" do
    let(:user) { nil }
    it { is_expected.to permit_action(:forbidden) }
    it { is_expected.to permit_action(:internal_server_error) }
    it { is_expected.to permit_action(:not_found) }
  end

  context "for an authorized user" do
    let(:user) { FactoryGirl.create(:user) }
    it { is_expected.to permit_action(:forbidden) }
    it { is_expected.to permit_action(:internal_server_error) }
    it { is_expected.to permit_action(:not_found) }
  end
end
