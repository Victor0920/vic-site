class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  around_action :switch_locale

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes


  # Pick the locale from ?locale=es, falling back to the default for
  # anything missing or unknown (I18n.with_locale raises on unknown locales).
  def switch_locale(&action)
    locale = params[:locale].presence_in(I18n.available_locales.map(&:to_s)) || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
