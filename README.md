# Maddie Burke — Portfolio Site

A portfolio site for Maddie Burke, a senior-year fashion design major at San Francisco State, presenting five bodies of work to hiring managers, MFA admissions committees, and commission enquiries.

Built and maintained by [Michael Tashjian](https://github.com/mambo-sun).

**Live site:** <https://maddie-burke-portfolio.onrender.com> — auto-deploys from `main`
**Domain:** `grandmamaddiedesigns.com` — verified available, not yet registered

> The live site currently serves a holding page. The real Home page lands in Phase 4.

---

## Stack

Deliberately minimal. No framework, no build step, no dependencies.

| Layer | Tool |
|---|---|
| Structure & style | HTML, CSS |
| Interactivity | Vanilla JavaScript (~150 lines total) |
| Hosting | Render — Static Site |
| Version control | Git + GitHub |

No server, no database, and no user input anywhere on the site — which is why the security surface is as small as it is.

## Running locally

There is no build step. Any static file server works:

```bash
python3 -m http.server 8000
```

Then open <http://localhost:8000>.

Opening `index.html` directly via `file://` mostly works, but root-relative paths (`/assets/...`) will not resolve — use the server.

## Structure

```
index.html              Home
work.html               Work index
about.html  contact.html
work/                   One page per project
assets/  css · js · fonts · img
```

Project slugs are permanent — display titles can change freely, but changing a slug breaks every link that has been shared.

## Documentation

- **[PLAN.md](PLAN.md)** — purpose, audience, site map, feature list, security and accessibility commitments. The why.
- **[STYLEGUIDE.md](STYLEGUIDE.md)** — colour tokens, type scale, spacing, component inventory, build rules. The how, and the source of truth for anything visual.

Both are kept current as the site is built. If the code and `STYLEGUIDE.md` disagree, one of them is a bug.

## Design direction

Drawn from **Biba**, Barbara Hulanicki's 1970s London label — the period fusion of Art Deco geometry with Art Nouveau line work, jewel tones, and gilded depth. Taken as mood only: no reproduction of Biba's monogram, logotype, or trade dress, which are trademarked. The work here is original.

Colour is organised in two zones — a dark "chrome" for navigation, headers and footer, and a light bone ground for galleries and reading, so garment colour reads true instead of taking a cast from a saturated background.

## Accessibility

Targets WCAG 2.1 AA sitewide, AAA on navigation. Every colour value in `STYLEGUIDE.md` was contrast-verified before use, and two of the results are enforced as build rules rather than preferences. Details in `STYLEGUIDE.md` §2 and §8.

## Licence

No licence — all rights reserved. The code is public for reference; the photography and garment designs belong to Maddie Burke and are not licensed for reuse.
