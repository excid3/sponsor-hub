require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SponsorHub
  def self.configure_allowed_ips
    github_web_hook_ips = %w[192.30.252.0/22
                               185.199.108.0/22
                               140.82.112.0/20
                               143.55.64.0/20
                               2a0a:a440::/29
                               2606:50c0::/32]

    local_ips = %w[127.0.0.0/24]
    github_web_hook_ips + local_ips
  end

  class DevSimpleFormatter < ::Logger::Formatter
    def call(severity, timestamp, progname, msg)
      "#{String === msg ? "%5s | %s" % [severity, msg] : msg.inspect}\n"
    end
  end

  class Application < Rails::Application

    Rails.logger = Logger.new(STDOUT)
    Rails.logger.class.include ActiveSupport::LoggerSilence
    Rails.logger.level = Logger::DEBUG
    Rails.logger.formatter = DevSimpleFormatter.new

    config.active_job.queue_adapter = :sidekiq
    config.application_name = Rails.application.class.module_parent_name
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.web_console.allowed_ips = SponsorHub.configure_allowed_ips
    config.session_store :cookie_store, key: '_sponsor_hub_session'

    Rails.logger.debug("config.web_console.allowed_ips:(#{config.web_console.allowed_ips.each(&:to_s)})")
  end
end
