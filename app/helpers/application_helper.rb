module ApplicationHelper
  def site
    Rails.application.config.x.site
  end

  def whatsapp_number
    site.whatsapp_number.presence ||
      raise("WHATSAPP_NUMBER environment variable is not set")
  end

  # Human-readable number for display, e.g. "+34 600 000 000"
  def whatsapp_number_display
    n = whatsapp_number
    "+#{n[0, 2]} #{n[2, 3]} #{n[5, 3]} #{n[8, 3]}"
  end

  def whatsapp_url(text = "Hi Víctor, I'd like to talk about a project.")
    "https://wa.me/#{whatsapp_number}?text=#{ERB::Util.url_encode(text)}"
  end

  def contact_email
    site.email.presence ||
      raise("CONTACT_EMAIL environment variable is not set")
  end

  # Renders an empty image placeholder. Swap the <div> for an image_tag once
  # the real picture is added to app/assets/images/.
  def image_placeholder(label, css_class: "")
    content_tag(:div, class: "img-placeholder #{css_class}", "aria-label": label, role: "img") do
      content_tag(:span, label, class: "img-placeholder__label")
    end
  end
end
