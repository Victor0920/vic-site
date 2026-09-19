# Site-wide settings for the personal website.
# Translatable texts (tagline, location, …) live in config/locales/*.yml.
# Contact details come from environment variables (see .env in development;
# set them on the server in production). Read with ENV[] rather than ENV.fetch
# so the app can boot without them (e.g. during `assets:precompile` in the
# Docker build); the helpers raise if one is missing when a page needs it.
Rails.application.config.x.site.name = "Víctor Vidal"
Rails.application.config.x.site.whatsapp_number = ENV["WHATSAPP_NUMBER"]
Rails.application.config.x.site.email = ENV["CONTACT_EMAIL"]
Rails.application.config.x.site.linkedin_url = "https://www.linkedin.com/in/victor-vidal-sanchis"
Rails.application.config.x.site.github_url = ENV["GITHUB_URL"]
