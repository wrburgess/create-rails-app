class ErrorsController < ApplicationController
  layout "errors"

  def forbidden
    authorize :errors, :forbidden?
    render status: :forbidden
  end

  def internal_server_error
    authorize :errors, :internal_server_error?
    render status: :internal_server_error
  end

  def not_found
    authorize :errors, :not_found?
    render status: :not_found
  end
end
