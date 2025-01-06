require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot for better performance and memory savings (ignored by Rake tasks).
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Turn on fragment caching in view templates.
  config.action_controller.perform_caching = true

  # Cache assets for far-future expiry since they are all digest stamped.
  config.public_file_server.headers = { "cache-control" => "public, max-age=#{1.year.to_i}" }

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # *** TEMPORARILY DISABLE SSL TO DEBUG ***
  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = false # Tạm thời tắt SSL để kiểm tra lỗi redirect loop.

  # Assume all access to the app is happening through a SSL-terminating reverse proxy.
  config.assume_ssl = false # Tắt SSL assumption khi debug.

  # Nếu cần bảo vệ trang sức khỏe:
  config.ssl_options = { redirect: { exclude: ->(request) { request.path == "/up" } } }

  # Log to STDOUT with the current request id as a default log tag.
  config.log_tags = [:request_id]
  config.logger   = ActiveSupport::TaggedLogging.logger(STDOUT)

  # Change to "debug" to log everything (including potentially personally-identifiable information!)
  config.log_level = :debug # Tăng mức log để theo dõi chi tiết hơn.

  # Prevent health checks from clogging up the logs.
  config.silence_healthcheck_path = "/up"

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Replace the default in-process memory cache store with a durable alternative.
  config.cache_store = :memory_store # Sử dụng bộ nhớ để tạm kiểm tra.

  # Replace the default in-process and non-durable queuing backend for Active Job.
  config.active_job.queue_adapter = :inline # Sử dụng inline để đơn giản hoá trong debug.

  # Ignore bad email addresses and do not raise email delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Set host to be used by links generated in mailer templates.
  config.action_mailer.default_url_options = { host: "manguonmo-mmso.onrender.com", protocol: "http" }

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Only use :id for inspections in production.
  config.active_record.attributes_for_inspect = [:id]

  # Enable DNS rebinding protection and other `Host` header attacks.
  config.hosts = [
    "manguonmo-mmso.onrender.com", # Cho phép domain Render của bạn.
    /.*\.onrender\.com/ # Cho phép tất cả subdomain của Render.
  ]
end
