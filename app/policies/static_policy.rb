class StaticPolicy < Struct.new(:user, :static)
  def about?
    true
  end

  def contact?
    true
  end

  def home?
    true
  end

  def robots?
    true
  end

  # TODO: This is an example policy and can be deleted later
  def secure?
    user
  end
end
