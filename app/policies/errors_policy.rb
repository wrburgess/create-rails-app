class ErrorsPolicy < Struct.new(:user, :errors)
  def forbidden?
    true
  end

  def internal_server_error?
    true
  end

  def not_found?
    true
  end
end
