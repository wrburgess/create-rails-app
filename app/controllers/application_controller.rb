class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private def permission_denied
    flash[:error] = "Unauthorized request"
    redirect_to(root_path)
  end
end
