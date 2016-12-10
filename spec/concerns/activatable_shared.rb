require "rails_helper"

shared_examples "activatable" do
  it "is active by default" do
    instance_of_class = FactoryGirl.create(described_class.to_s.underscore.to_sym)
    expect(instance_of_class.active?).to be_truthy
  end

  it "is not archived by default" do
    instance_of_class = FactoryGirl.create(described_class.to_s.underscore.to_sym)
    expect(instance_of_class.archived).to be_falsey
  end

  it "is not tested by default" do
    instance_of_class = FactoryGirl.create(described_class.to_s.underscore.to_sym)
    expect(instance_of_class.test).to be_falsey
  end

  it "is not dummied by default" do
    instance_of_class = FactoryGirl.create(described_class.to_s.underscore.to_sym)
    expect(instance_of_class.dummy).to be_falsey
  end

  describe ".activate" do
    it "makes the instance active" do
      instance_of_class = FactoryGirl.create(described_class.name.underscore.to_sym, :archived, :test, :dummy)
      expect(instance_of_class.archived).to be_truthy
      expect(instance_of_class.test).to be_truthy
      expect(instance_of_class.dummy).to be_truthy
      instance_of_class.activate!
      expect(instance_of_class.archived).to be_falsey
      expect(instance_of_class.test).to be_falsey
      expect(instance_of_class.dummy).to be_falsey
    end
  end

  describe ".archive!" do
    it "makes the instance archived" do
      instance_of_class = FactoryGirl.create(described_class.name.underscore.to_sym, archived: false)
      expect(instance_of_class.archived).to be_falsey
      instance_of_class.archive!
      expect(instance_of_class.archived).to be_truthy
    end
  end

  describe ".unarchive!" do
    it "makes the instance unarchived" do
      instance_of_class = FactoryGirl.create(described_class.name.underscore.to_sym, :archived)
      expect(instance_of_class.archived).to be_truthy
      instance_of_class.unarchive!
      expect(instance_of_class.archived).to be_falsey
    end
  end

  describe ".testify!" do
    it "makes the instance in a state of test" do
      instance_of_class = FactoryGirl.create(described_class.name.underscore.to_sym)
      expect(instance_of_class.test).to be_falsey
      instance_of_class.testify!
      expect(instance_of_class.test).to be_truthy
    end
  end

  describe ".dummify!" do
    it "makes the instance dummied" do
      instance_of_class = FactoryGirl.create(described_class.name.underscore.to_sym)
      expect(instance_of_class.dummy).to be_falsey
      instance_of_class.dummify!
      expect(instance_of_class.dummy).to be_truthy
    end
  end

  describe ".actives" do
    it "only selects instances where archived and test is false" do
      FactoryGirl.create(described_class.name.underscore.to_sym, :archived, :test)
      FactoryGirl.create(described_class.name.underscore.to_sym, :archived)
      FactoryGirl.create(described_class.name.underscore.to_sym, :test)
      FactoryGirl.create(described_class.name.underscore.to_sym, :dummy)
      FactoryGirl.create(described_class.name.underscore.to_sym, test: false, archived: false, dummy: false)
      expect(described_class.count).to eq 5
      expect(described_class.actives.count).to eq 1
    end
  end

  describe ".inactives" do
    it "only selects instances where archived and test is false" do
      FactoryGirl.create(described_class.name.underscore.to_sym, :archived)
      FactoryGirl.create(described_class.name.underscore.to_sym, :test)
      FactoryGirl.create(described_class.name.underscore.to_sym, :dummy)
      FactoryGirl.create(described_class.name.underscore.to_sym, archived: false, test: false, dummy: false)
      expect(described_class.count).to eq 4
      expect(described_class.inactives.count).to eq 3
    end
  end

  describe ".archives" do
    it "only selects instances where archived is false" do
      FactoryGirl.create(described_class.name.underscore.to_sym, :archived)
      FactoryGirl.create(described_class.name.underscore.to_sym, :archived)
      FactoryGirl.create(described_class.name.underscore.to_sym, archived: false)
      expect(described_class.count).to eq 3
      expect(described_class.archives.count).to eq 2
    end
  end

  describe ".tests" do
    it "only selects instances where test is false" do
      FactoryGirl.create(described_class.name.underscore.to_sym, :test)
      FactoryGirl.create(described_class.name.underscore.to_sym, :test)
      FactoryGirl.create(described_class.name.underscore.to_sym, test: false)
      expect(described_class.count).to eq 3
      expect(described_class.tests.count).to eq 2
    end
  end

  describe ".dummies" do
    it "only selects instances where dummy is true" do
      FactoryGirl.create(described_class.name.underscore.to_sym, :dummy)
      FactoryGirl.create(described_class.name.underscore.to_sym, :dummy)
      FactoryGirl.create(described_class.name.underscore.to_sym, dummy: false)
      expect(described_class.count).to eq 3
      expect(described_class.dummies.count).to eq 2
    end
  end
end
