class User < ApplicationRecord
  include Activatable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable

  validates :time_zone, presence: true

  def full_name
    "#{first_name} #{last_name}".gsub(/\b('?[a-z])/) { $1.capitalize }.strip
  end

  def first_name_abbreviated(last_name_length = 7)
    first_name_abbrev = first_name.gsub(/\b('?[a-z])/) { $1.capitalize }.strip.slice(0, 1)
    last_name_abbrev = last_name.gsub(/\b('?[a-z])/) { $1.capitalize }.strip.slice(0, last_name_length)
    "#{first_name_abbrev}. #{last_name_abbrev}"
  end

  def last_name_abbreviated(first_name_length = 7)
    first_name_abbrev = first_name.gsub(/\b('?[a-z])/) { $1.capitalize }.strip.slice(0, first_name_length)
    last_name_abbrev = last_name.gsub(/\b('?[a-z])/) { $1.capitalize }.strip.slice(0, 1)
    "#{first_name_abbrev} #{last_name_abbrev}."
  end

  def role_of?(role)
    roles.include? role
  end

  def admin?
    role_of? UserRoles::ADMIN
  end

  def staff?
    role_of? UserRoles::STAFF
  end

  def customer?
    role_of? UserRoles::CUSTOMER
  end

  def roles_presented
    roles.join(", ")
  end

  def self.seed(roles:, dummy:)
    fake_password = SecureRandom.urlsafe_base64
    user_attrs = {
      email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
      password: fake_password, password_confirmation: fake_password, roles: roles, time_zone: "UTC",
      archived: false, test: false, dummy: dummy
    }
    user = new(user_attrs)
    user.skip_confirmation!
    user.save!
  end
end
