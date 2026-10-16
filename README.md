# Afromotion

The generated static website is in [`afromotion/`](./afromotion/). The source
generator is [`setup-afromotion.sh`](./setup-afromotion.sh).
Regenerating optimized image assets requires the `cwebp` command from the
WebP tools package and the image source files in [`assets/images/`](./assets/images/).
The homepage hero uses `kl-bg-desktop.png` and `kl-bg-phone.png` from that
folder for desktop and mobile backgrounds.

The site includes Home, Events, Artists, Gallery, Merch, Quiz, About and
Contact pages. The 25-question artist quiz runs entirely in the browser.
The theme selector offers Dark, Light, Ocean Breeze and Sunset Serenity, and
saves the selection in the browser.
Contact links include Instagram and the Afromotion WhatsApp community; events
and artist pages link to event registration and team sign-up forms.

## Preview locally

```sh
cd afromotion
python3 -m http.server 8000
```

Then open <http://localhost:8000>.

## GitHub Pages

The `main` branch deploys the `afromotion/` site directory to GitHub Pages
using [`.github/workflows/pages.yml`](./.github/workflows/pages.yml).

Live site: <https://surrell-byte.github.io/afromotion/>
