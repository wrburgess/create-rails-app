module UserRoles
  ADMIN = "admin".freeze
  STAFF = "staff".freeze
  CUSTOMER = "customer".freeze

  def self.company_roles
    [self::ADMIN, self::STAFF]
  end

  def self.customer_roles
    [self::CUSTOMER]
  end

  def self.all
    [
      self::ADMIN,
      self::STAFF,
      self::CUSTOMER
    ]
  end
end
