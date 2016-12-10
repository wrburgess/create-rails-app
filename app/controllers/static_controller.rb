class StaticController < ApplicationController
  layout "application"

  def home
    authorize :static, :home?
    set_action_payload("Data from the StaticController#home action")
  end

  def about
    authorize :static, :about?
  end

  def contact
    authorize :static, :contact?
  end

  def robots
    authorize :static, :robots?
    respond_to :text
    expires_in 6.hours, public: true
  end

  # TODO: This is an example action and can be deleted later
  def secure
    authorize :static, :secure?
    set_action_payload("Data from the StaticController#secure action")
  end
end
