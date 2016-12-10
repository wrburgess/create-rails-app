# TODO: Delete this example job spec

require "rails_helper"

RSpec.describe ExampleJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later("param_1", "param_2") }

  it "queues the job" do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it "matches with enqueued job" do
    expect { described_class.perform_later }.to have_enqueued_job(described_class)
  end

  it "is in default queue" do
    expect(described_class.new.queue_name).to eq("default")
  end

  it "executes perform" do
    perform_enqueued_jobs { job }
    expect(User.count).to eq 1
  end
end
