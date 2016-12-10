# TODO: Delete this example job

class ExampleJob < ActiveJob::Base
  queue_as :default

  rescue_from(ActiveRecord::RecordNotFound) do
    retry_job wait: 1.minute, queue: :default
  end

  def perform(param_1, param_2)
    User.create(email: "#{param_1}@#{param_2}.com", password: "12345678", password_confirmation: "12345678")
  end
end
