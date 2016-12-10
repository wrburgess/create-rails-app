Sidekiq.configure_server do |config|
  config.redis = { size: ENV["MIN_THREADS"], url: ENV["REDIS_URL"] }
end

Sidekiq.configure_client do |config|
  config.redis = { size: ENV["MIN_THREADS"], url: ENV["REDIS_URL"] }
end
