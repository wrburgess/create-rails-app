require "rails_helper"
require "concerns/activatable_shared"

describe User, type: :model do
  it_behaves_like "activatable"

  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "is invalid without an email address" do
    expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
  end

  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end

  it "is invalid without a sufficient password" do
    expect(FactoryGirl.build(:user, password: "1234567")).not_to be_valid
  end

  it "is invalid without a time zone" do
    expect(FactoryGirl.build(:user, time_zone: nil)).not_to be_valid
  end

  describe "#full_name" do
    it "renders the user first and last name separated by a space" do
      user = FactoryGirl.create(:user, first_name: "Bubba", last_name: "Jones")
      expect(user.full_name).to eq "#{user.first_name.capitalize} #{user.last_name.capitalize}"
    end

    it "capitalizes the user first and last names" do
      user = FactoryGirl.create(:user, first_name: "bubba", last_name: "jones")
      expect(user.full_name).to eq "#{user.first_name.capitalize} #{user.last_name.capitalize}"
    end

    it "capitalizes the user first name and trims any pre-fixed space" do
      user = FactoryGirl.create(:user, first_name: "bubba", last_name: "")
      expect(user.full_name).to eq user.first_name.capitalize
    end

    it "capitalizes the user last name and trims any post-fixed space" do
      user = FactoryGirl.create(:user, first_name: "", last_name: "jones")
      expect(user.full_name).to eq user.last_name.capitalize
    end

    context "nil names" do
      it "capitalizes the user last name and trims any post-fixed space" do
        user = FactoryGirl.create(:user, first_name: nil, last_name: "jones")
        expect(user.full_name).to eq user.last_name.capitalize
      end

      it "capitalizes the user first name and trims any post-fixed space" do
        user = FactoryGirl.create(:user, first_name: "bubba", last_name: nil)
        expect(user.full_name).to eq user.first_name.capitalize
      end

      it "returns a blank" do
        user = FactoryGirl.create(:user, first_name: nil, last_name: nil)
        expect(user.full_name).to eq ""
      end
    end

    describe "#first_name_abbreviated" do
      it "renders the user first name abbreviated with period, last name by seven characters" do
        user = FactoryGirl.create(:user, first_name: "Bubba", last_name: "Schemmel")
        expect(user.first_name_abbreviated).to eq "B. Schemme"
      end

      it "renders the user first name abbreviated with period, last name by seven or less chars" do
        user = FactoryGirl.create(:user, first_name: "Mark", last_name: "Smith")
        expect(user.first_name_abbreviated).to eq "M. Smith"
      end

      it "renders the user first abbreviated by a single character and last name by argument" do
        user = FactoryGirl.create(:user, first_name: "Bubba", last_name: "Jones-Smitherwich")
        expect(user.first_name_abbreviated(10)).to eq "B. Jones-Smit"
      end
    end

    describe "#last_name_abbreviated" do
      it "renders the user first name by seven characters, last name abbreviated with period" do
        user = FactoryGirl.create(:user, first_name: "Bubbalicious", last_name: "Schemmel")
        expect(user.last_name_abbreviated).to eq "Bubbali S."
      end

      it "renders the user first name by seven or less chars, last name abbreviated with period" do
        user = FactoryGirl.create(:user, first_name: "Mark", last_name: "Smith")
        expect(user.last_name_abbreviated).to eq "Mark S."
      end

      it "renders the user first abbreviated by a single character and last name by argument" do
        user = FactoryGirl.create(:user, first_name: "Bubbalicious", last_name: "Jones-Smitherwich")
        expect(user.last_name_abbreviated(14)).to eq "Bubbalicious J."
      end
    end

    describe "#admin?" do
      it "returns true if user has a role qualified as admin" do
        user = FactoryGirl.create :user, :admin
        expect(user.admin?).to be_truthy
      end

      it "returns false if user lacks the admin role" do
        user = FactoryGirl.create :user, :customer
        expect(user.admin?).to be_falsey
      end
    end

    describe "#staff?" do
      it "returns true if user has a role qualified as staff" do
        user = FactoryGirl.create :user, :staff
        expect(user.staff?).to be_truthy
      end

      it "returns false if user lacks the staff role" do
        user = FactoryGirl.create :user, :customer
        expect(user.staff?).to be_falsey
      end
    end

    describe "#customer?" do
      it "returns true if user has role of customer" do
        user = FactoryGirl.create :user, :customer
        expect(user.customer?).to be_truthy
      end

      it "returns false if user lacks the customer role" do
        user = FactoryGirl.create :user, :admin
        expect(user.customer?).to be_falsey
      end
    end

    describe "#role_of?" do
      it "returns true if user has matching user role" do
        user = FactoryGirl.create :user, :customer
        expect(user.role_of?(UserRoles::CUSTOMER)).to be_truthy
      end

      it "returns false if user does not have matching user role" do
        user = FactoryGirl.create :user, :admin
        expect(user.role_of?(UserRoles::CUSTOMER)).to be_falsey
      end
    end
  end

  describe "#roles_presented" do
    it "returns the user roles as a string with comma separation" do
      user = FactoryGirl.create :user, roles: [UserRoles::ADMIN, UserRoles::CUSTOMER]
      expect(user.roles_presented).to eq "#{UserRoles::ADMIN}, #{UserRoles::CUSTOMER}"
    end
  end
end
