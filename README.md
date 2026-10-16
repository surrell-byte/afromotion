# Afromotion

The generated static website is in [`afromotion/`](./afromotion/). The source
generator is [`setup-afromotion.sh`](./setup-afromotion.sh).
Regenerating optimized image assets requires the `cwebp` command from the
WebP tools package.

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
