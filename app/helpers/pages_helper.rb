module PagesHelper
  # Renders a legal-page text from the locale files, replacing its
  # placeholders (%{email}, %{privacy_policy}, %{aepd}) with links. The text
  # is escaped first, so only these links are output as HTML.
  def legal_text(text)
    links = {
      email: mail_to(contact_email),
      privacy_policy: link_to(t("layout.footer.privacy_policy"), privacy_policy_path(locale: I18n.locale)),
      aepd: link_to("www.aepd.es", "https://www.aepd.es", target: "_blank", rel: "noopener")
    }
    I18n.interpolate(ERB::Util.html_escape(text).to_str, links).html_safe
  end
end
