# Víctor Vidal — personal website

Single-page site for a freelance full stack developer based in Aspe (Alicante, Spain).
Built with Ruby on Rails 8.1, Propshaft and importmap, with the same structure as `../website`.

## Run locally

```bash
cp .env.example .env   # then fill in the values
bundle install
bin/rails server
```

Open http://localhost:3000.

## Configuration

Contact details are read from environment variables (`.env` in development via `dotenv-rails`;
in production set them on the server or in `config/deploy.yml`):

| Variable          | Purpose                                                    |
|-------------------|------------------------------------------------------------|
| `WHATSAPP_NUMBER` | International format, digits only (`34600000000`)          |
| `CONTACT_EMAIL`   | Public email shown on the site                             |
| `GITHUB_URL`      | Optional. If empty, the GitHub link is hidden              |

Name, tagline, location and LinkedIn URL live in `config/initializers/site.rb`.

## Adding images

Images are intentionally empty. Each slot is marked with the `image_placeholder("...")`
helper in `app/views/pages/home.html.erb`.

1. Save the image in `app/assets/images/` (e.g. `portrait.jpg`).
2. Replace the placeholder call with an `image_tag`:

```erb
<%# before %>
<%= image_placeholder("Photo: portrait of Víctor", css_class: "img-placeholder--portrait") %>

<%# after %>
<%= image_tag "portrait.jpg", alt: "Víctor Vidal", class: "hero__image" %>
```

Available slots:

| Section        | Placeholder                    | Suggested size |
|----------------|--------------------------------|----------------|
| Hero           | Portrait                       | 800 × 1000     |
| About          | Workspace or project           | 900 × 1200     |
| Services (×6)  | One icon per service           | 144 × 144      |

## Structure

- `app/views/pages/home.html.erb` — all page content.
- `app/views/layouts/application.html.erb` — header, footer and floating WhatsApp button.
- `app/helpers/application_helper.rb` — contact and placeholder helpers.
- `app/assets/stylesheets/` — `variables.css`, `application.css`, `components/`, `views/`.

## Deploy with Kamal

Requirements: Docker on your Mac, a Linux server with SSH access as `root`, and a domain pointing at its IP.

1. Edit `config/deploy.yml`: server IP (`servers.web`), domain (`proxy.host`),
   registry username (`image` and `registry.username`) and the `env.clear` variables.
2. Export the registry token:
   ```bash
   export KAMAL_REGISTRY_PASSWORD=dckr_pat_...
   ```
3. First time: `bin/kamal setup`. Subsequent deploys: `bin/kamal deploy`.

Useful: `bin/kamal logs`, `bin/kamal console`, `bin/kamal shell`, `bin/kamal app details`.
