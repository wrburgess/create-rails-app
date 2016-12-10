module Activatable
  extend ActiveSupport::Concern

  included do
    scope :actives, -> { where(archived: false, test: false, dummy: false) }
    scope :inactives, -> { where("archived IS TRUE OR test IS TRUE OR dummy IS TRUE") }
    scope :archives, -> { where(archived: true) }
    scope :tests, -> { where(test: true) }
    scope :dummies, -> { where(dummy: true) }
  end

  def active?
    !archived && !test && !dummy
  end

  def activate!
    update(archived: false, test: false, dummy: false)
  end

  def archive!
    update(archived: true)
  end

  def unarchive!
    update(archived: false)
  end

  def testify!
    update(test: true)
  end

  def dummify!
    update(dummy: true)
  end
end
