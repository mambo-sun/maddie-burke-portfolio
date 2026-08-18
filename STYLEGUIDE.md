# Style Guide — Maddie Burke Portfolio

**The single source of truth for how this site is built.** If the code and this file disagree, one of them is a bug.

Derived from `PLAN.md` §3. Every value here was contrast-verified before it was written down, not after.

**Update this file the moment a build step introduces a new pattern** — a guide that drifts out of sync with the code is worse than no guide, because it gets trusted.

---

## 1. The zone system

This is the core architectural decision of the stylesheet, so read this before writing any CSS.

The site has **two colour zones** (`PLAN.md` §3). Rather than writing two sets of components, every component is written **once** against abstract tokens (`--text`, `--ground`, `--accent`), and the *zone* redefines what those tokens mean.

```css
/* Zone 2 — light. The default, used by most of the site. */
:root {
  --ground:       #F6F1E7;  /* bone — page background */
  --surface:      #FFFFFF;  /* raised cards, image mats */
  --text:         #241A20;  /* body copy */
  --muted:        #544649;  /* captions, secondary */
  --accent:       #7A2A38;  /* oxblood — links, labels */
  --accent-gold:  #5E4A0F;  /* antique gold — text-safe on bone */
  --gilt:         #C9A227;  /* DECORATIVE ONLY — see §2 */
  --hairline:     rgba(36, 26, 32, 0.14);
}

/* Zone 1 — dark chrome. Applied to nav, hero, project headers, footer. */
.zone-dark {
  --ground:       #17101B;  /* ink */
  --surface:      #241A2B;
  --text:         #F3E9DB;  /* bone */
  --muted:        #B5A49E;
  --accent:       #D9A93A;  /* gold — unrestricted here */
  --accent-alt:   #E08C97;  /* rose */
  --fill:         #8C2F3F;  /* oxblood — FILL ONLY, never text */
  --hairline:     rgba(243, 233, 219, 0.16);
}
```

**Why it is done this way:** a component written as `color: var(--text); background: var(--ground)` is automatically correct in both zones, and stays correct if a value is ever tuned. The alternative — `.card` and `.card--dark` — doubles every component and guarantees the two drift apart. Add `class="zone-dark"` to a section and everything inside it adapts.

**The one rule that makes it safe:** a component must never reference a raw hex value. If you find yourself typing `#` inside a component rule, either the token is missing or you are about to create a zone bug.

---

## 2. Two build rules that are not preferences

These came out of contrast checks and they are not stylistic calls.

### Gilt carries no information on light grounds

`--gilt` (`#C9A227`) on bone measures **2.15:1**. That fails the 4.5:1 text threshold *and* the 3:1 non-text threshold — a thin bright-gold rule or icon on cream is close to invisible to a low-vision visitor.

- ✅ Ornament dividers, decorative flourishes, anything `aria-hidden`
- ❌ Link colour, current-page markers, icons without labels, borders that convey state
- Where gold must *say* something on bone, use `--accent-gold` (`#5E4A0F`, 7.58:1)
- In `.zone-dark`, gold is unrestricted — `--accent` there is `#D9A93A` at 8.60:1

### Abril Fatface has a 28px floor

Fat faces fall apart small: thin strokes vanish, counters fill in. Abril is used for **display, H1 and H2 only**. H3 and below is Karla 600.

H2's minimum is `1.75rem` (28px), not `1.5rem`, specifically so Abril never renders below its floor on a narrow phone. That is why the scale is not a clean doubling — it is deliberate, do not "fix" it.

---

## 3. Typography

Self-hosted, latin-subset `.woff2` in `assets/fonts/`. Not the Google Fonts CDN — self-hosting is faster and removes a third-party request from every visitor.

```css
@font-face {
  font-family: "Abril Fatface";
  src: url("/assets/fonts/abril-fatface.woff2") format("woff2");
  font-weight: 400;
  font-display: swap;
}
@font-face {
  font-family: "Karla";
  src: url("/assets/fonts/karla.woff2") format("woff2");
  font-weight: 400 700;   /* variable */
  font-display: swap;
}

:root {
  --font-display: "Abril Fatface", Georgia, serif;
  --font-body: "Karla", system-ui, -apple-system, sans-serif;
}
```

Preload Abril in every page `<head>` — it renders in the hero, so it is on the critical path:

```html
<link rel="preload" href="/assets/fonts/abril-fatface.woff2" as="font" type="font/woff2" crossorigin>
```

### Scale

| Level | Size | Face | Weight |
|---|---|---|---|
| Display | `clamp(2.5rem, 7vw, 5rem)` | Abril | 400 |
| H1 | `clamp(2rem, 5vw, 3.25rem)` | Abril | 400 |
| H2 | `clamp(1.75rem, 3vw, 2.25rem)` | Abril | 400 |
| H3 | `1.25rem` | Karla | 600 |
| Body | `1.0625rem` (17px) | Karla | 400 |
| Small / caption | `0.875rem` | Karla | 400 |
| Label / eyebrow | `0.6875rem`, `0.14em` tracking, uppercase | Karla | 600 |

- Line-height **1.6** body, **1.15** headings
- Measure capped at **65ch** on any block of running text
- All sizes in `rem` — never `px` for type, or browser text resizing breaks
- `text-wrap: balance` on headings

---

## 4. Spacing

One scale. No off-scale values — this is the main thing that keeps a hand-built site from drifting.

```css
:root {
  --space-1: 4px;   --space-2: 8px;   --space-3: 16px;
  --space-4: 24px;  --space-5: 32px;  --space-6: 48px;
  --space-7: 64px;  --space-8: 96px;  --space-9: 128px;
}
```

Lay out sibling groups with flex/grid + `gap`, not per-element margins — margins collapse and double in ways that are hard to trace.

---

## 5. Breakpoints

Mobile-first. Base styles are mobile; add complexity upward with `min-width`.

```css
/* base = mobile, ≤599px */
@media (min-width: 600px)  { /* tablet */ }
@media (min-width: 900px)  { /* desktop */ }
@media (min-width: 1400px) { /* wide */ }
```

- Container max-width **1320px**, centred
- Work index: feature card full-width, remaining two at 2 columns from 600px up
- Documentary grid: **2 columns even on mobile** — one-per-screen makes these pages endless. Runway 2026 goes to 3 columns from tablet up, since its images cannot exceed ~500px anyway
- Nav collapses to a toggle below 600px

---

## 6. Components

Built once, reused everywhere. Adding a new one means adding it here in the same commit.

| # | Component | Notes |
|---|---|---|
| 1 | Skip link | First focusable element on every page, `href="#main"` |
| 2 | Nav | Always `.zone-dark`. Wordmark + 3 links. Toggle below 600px, progressively enhanced. `aria-current="page"` **plus** a visual rule |
| 3 | Footer | Always `.zone-dark`. Contact, socials, year |
| 4 | Button | `.btn` primary (fill) / `.btn--ghost` outlined. **Min 44×44px** |
| 5 | Project card | `.card` standard / `.card--feature` full-width. Image, category label, title, year |
| 6 | Category label | Pill: `Collection` / `Runway show` / `Selected work` |
| 7 | Image grid | CSS Grid, 1 → 2 columns |
| 8 | Lightbox | Keyboard-complete, focus-trapped — see §8 |
| 9 | Section header | Eyebrow + heading + optional intro |
| 10 | Documentary grid | Tighter grid, consistent crops, white mats — see §7 |
| 11 | Credits block | `<dl>`. Faceted Fairytale and Runway 2026 only |
| 12 | Ornament divider | The faceted lozenge. **Marks every zone boundary.** `aria-hidden="true"` |
| 13 | Caption | Image caption + material/technique note |
| 14 | Pill / tag | Materials and techniques |
| 15 | Hero | Home only. Text + image, side by side from 900px. Image eager with `fetchpriority="high"`, never lazy |

**Buttons are the zone system's clearest payoff.** One rule — `background: var(--accent); color: var(--ground)` — resolves to two independently verified pairings: ink on gold at 8.60:1 in the dark zone, bone on oxblood at 8.42:1 in the light zone. Both AAA, no `.btn--dark` variant, and no way for the two to drift apart.

**Zone boundaries bleed, they do not cut.** Every ink/bone seam uses a halftone **ink bleed** (`style.css` §23): the ink breaks into a dot screen and dissolves through the top of the section beneath it.

Each dot *row* is its own `repeat-x` radial-gradient layer with its own radius, one cell lower than the last — that is what makes the dots genuinely shrink. Masking one dot field with a fade would only drop their opacity, which reads as a screen dimming rather than ink breaking apart. **`background-size` is load-bearing**: without it each layer fills the element instead of tiling, and the effect collapses entirely.

The top rows sit above `0.707 × cell`, the radius at which circles on a square grid cover the corners completely, so the join from solid ink is seamless. Just past it the gaps open as small stars — which is what a real halftone does at high coverage, not a bug.

`--bleed-cell` (12px) is the screen frequency, and every measurement derives from it: dot radius, row spacing, and total height. Change that one value to rescale the whole effect. `--ink` and `--bone` are the only tokens that do **not** change per zone; a bleed between zones has to name both grounds at once.

**The bleed paints its own bone ground.** The `::after` sits *inside* the dark section, so without `background-color: var(--bone)` it is transparent, the ink behind shows through, and ink dots on an ink background are perfectly invisible. `background-image` layers paint above `background-color` — the colour is the paper, the layers are the ink.

Content always begins **below** the bleed. Nothing is ever set over the dots, so no text sits on a patterned ground.

An earlier version used a four-stop warm gradient instead. It was replaced, but the finding behind it is worth keeping: a direct ink-to-bone ramp passes through dead grey (`#7D7679` even in OKLab) because both ends are near-neutral and the shortest path carries almost no chroma.

**Card titles respect the Abril floor.** Standard cards use Karla 700 at 1.25rem because 20px is below Abril's 28px limit. Only `.card--feature` is large enough for the display face, at `clamp(1.75rem, 4vw, 2.25rem)`.

**Naming:** simple BEM-ish — `.card`, `.card__title`, `.card--feature`. No utility-class soup; this site is small enough that named components stay readable.

---

## 7. Images

### Two registers (`PLAN.md` §5)

Not a quality bar — a deliberate difference in presentation.

- **Editorial** (Faceted Fairytale): large, full-bleed permitted, minimal captioning. 11 professional studio images that carry themselves
- **Documentary** (Runway 2026, Selected Work): tight uniform grid, consistent crops, **no full-bleed**, captions doing real work, each image on a `--surface` mat with consistent padding

**Hard ceiling on Runway 2026:** its sources are 532×800, so no image on that page may display wider than about 500px. Beyond that it upscales and softens. This is set by the assets, not by taste.

The mat is what makes photos shot on different tables on different days read as a deliberate series rather than a pile. Captions say *what the piece demonstrates*, not what it is.

### Markup pattern

```html
<img src="/assets/img/faceted-fairytale/look-03-1280.webp"
     srcset="/assets/img/faceted-fairytale/look-03-640.webp   640w,
             /assets/img/faceted-fairytale/look-03-1280.webp 1280w,
             /assets/img/faceted-fairytale/look-03-2000.webp 2000w"
     sizes="(min-width: 900px) 50vw, 100vw"
     width="1280" height="1600"
     loading="lazy" decoding="async"
     alt="Floor-length bias-cut silk slip in oxblood, cowl neck, self-covered buttons at the back">
```

- **Always** set `width`/`height` — prevents layout shift as images load
- `loading="lazy"` below the fold; the Home hero gets `fetchpriority="high"` and **no** lazy attribute
- Derivatives at 640 / 1280 / 2000px wide, WebP with JPEG fallback
- **EXIF stripped before commit** — camera originals carry GPS coordinates. Pipeline step, not a reminder
- Originals live in `assets/originals/` and are **gitignored**

---

## 8. Accessibility — non-negotiable

WCAG 2.1 AA sitewide, AAA on nav. These are build requirements, not a later audit.

- **Semantic HTML first.** `<nav>`, `<main>`, `<header>`, `<footer>`, `<button>`, `<a>` for their real purpose
- **Alt text on every meaningful image** — silhouette, fabric, colour, construction. Never a filename, never `"dress"`. Technical images describe what the piece *demonstrates*. Decorative ornament gets `alt=""`
- **One `<h1>` per page**, headings in order, no level skipped for styling
- **Visible focus** on everything focusable:
  ```css
  :focus-visible { outline: 2px solid var(--accent); outline-offset: 3px; }
  ```
  Never remove an outline without an equally visible replacement
- **Lightbox:** Esc closes, ←/→ navigate, focus trapped while open, focus returned to the triggering thumbnail on close, `aria-modal="true"`. A mouse-only lightbox is the most common accessibility failure on portfolio sites
- **No hover-only interactions.** Anything revealed on hover is permanently visible on touch
- **Touch targets ≥ 44×44px** with space between adjacent ones
- **`role="list"` on any list styled with `list-style: none`.** Safari and VoiceOver silently drop list semantics when the marker is removed, so a nav stops being announced as a list of N items. The role restores it. Applies to `.nav__list` and `.footer__links`
- **The mobile nav is progressively enhanced.** The toggle button is `display: none` until an inline script adds a `js` class to `<html>`. If that script never runs, the links stay visible and stacked instead of being sealed behind a dead button. Any future collapsible component follows the same pattern
- **Reduced motion:**
  ```css
  @media (prefers-reduced-motion: reduce) {
    *, *::before, *::after { animation: none !important; transition: none !important; }
  }
  ```
- **Zoom to 200%** without overlap or clipping

---

## 9. JavaScript

One `defer`-loaded `assets/js/main.js`. No framework, no dependencies. Whole-site budget ≈ 120–150 lines.

```html
<script src="/assets/js/main.js" defer></script>
```

```js
function initNav()      { /* mobile toggle */ }
function initLightbox() { /* gallery viewer */ }

document.addEventListener("DOMContentLoaded", () => {
  initNav();
  initLightbox();
});
```

Guard every init against a missing element — `main.js` loads on every page, but not every page has a gallery:

```js
function initLightbox() {
  const gallery = document.querySelector("[data-gallery]");
  if (!gallery) return;
  // ...
}
```

Lazy loading is native `loading="lazy"` — no JS involved.

---

## 10. File structure

```
/
├── index.html              Home
├── work.html               Work index
├── about.html
├── contact.html
├── work/
│   ├── faceted-fairytale.html
│   ├── runway-2026.html
│   └── selected.html
├── assets/
│   ├── css/style.css
│   ├── js/main.js
│   ├── fonts/*.woff2
│   ├── img/<project-slug>/*.webp
│   └── originals/          ← gitignored
├── PLAN.md
├── STYLEGUIDE.md
└── README.md
```

**Slugs are permanent.** Display titles can change freely; changing a slug after launch breaks every shared link.

---

## 11. Conventions

- **Commits:** `type(scope): description` — `feat(nav): add mobile toggle`, `fix(lightbox): restore focus on close`
- **Branches:** `feature/`, `fix/`, `chore/`. `main` is always deployable
- **CSS order:** tokens → reset → base elements → layout → components → utilities
- **Specificity:** keep it flat. If you need `!important`, the cascade is already wrong
