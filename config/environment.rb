# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

if ENV["START_WORLD_DAEMON"] == "yes"
  Thread.new do
    WorldDaemon.new.run
  end
end