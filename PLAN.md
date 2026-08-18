# Maddie Burke — Portfolio Site Plan

**Status:** Phase 3 complete (repo, hosting, style guide). Phase 4 in progress — foundation and holding page shipped. Site map revised down to three projects after the asset audit (§5).
**Client:** Maddie Burke, senior-year fashion design major, SFSU
**Built by:** Mikey Tashjian
**Stack:** fully static — HTML / CSS / vanilla JS on Render static hosting. No Express, no MongoDB, no Brevo. **Confirmed:** nothing on the site needs to be private, so there is no reason to add a backend.
**Domain:** `grandmamaddiedesigns.com` *(client's settled choice)* — verified available via whois. `grandmamaddie.com` and `grandmamaddiedesign.com` are also free; the short one is worth registering as a redirect while it is available. Supersedes the earlier `maddieburkedesigns.com`, which was never registered.

---

## 1. Purpose & audience

A portfolio site presenting Maddie Burke's collections and construction skill to people deciding whether to hire, admit, or commission her.

- **Design directors / hiring managers**, often skimming on a phone
- **MA/MFA admissions committees** — these want *process* evidence. The asset set contains none: no flats, no toiles, no drafted patterns (§5). That is the single biggest gap in this portfolio and the most valuable thing Maddie could add later
- **Competitions, awards, press**
- **Freelance and commission enquiries**

Three consequences that drive everything below:

1. **It is a recruiting instrument.** Contact reachable in one action from any page. No deadline is driving it *(confirmed)*, which means quality over speed and no reason to cut corners for a date.
2. **Mobile is the primary viewport.** Mobile-first per `responsive-design.md`.
3. **The work is the content.** Every gram of design personality must make the garments look better, never compete with them.

---

## 2. Site map

**Revised after the asset audit** (§5). The Drive folders promised five projects; the photography that exists supports three. There is no process documentation anywhere in the set — no flats, no toiles, no drafted patterns — so the two "technical study" pages are removed rather than filled with modelling shots that would misrepresent her.

| Page | File | Purpose |
|---|---|---|
| Home | `index.html` | Name, positioning, hero look, the three projects, routes to Work / Contact |
| Work | `work.html` | Index of all three projects — the hub |
| Faceted Fairytale | `work/faceted-fairytale.html` | **The named collection — the lead work of the site.** 11 studio images |
| Runway 2026 | `work/runway-2026.html` | SFSU 2026 runway show — one look, 7 images at 532×800 |
| Selected Work | `work/selected.html` | Four one-off garments, deliberately not cohesive — placeholder title |
| About | `about.html` | Bio, education, skills, machines & software, awards |
| Contact | `contact.html` | Email, Instagram, LinkedIn, availability |

Seven pages, down from nine. Spelling confirmed as **Faceted Fairytale**; slug `faceted-fairytale`.

### Why one flexible template beats a rigid one

The three projects are different kinds of thing, and one template flexes to fit rather than forcing them into a shape that suits only the collection:

| Project | Category label | Statement | Gallery | Images | Credits |
|---|---|---|---|---|---|
| **Faceted Fairytale** | Collection | Concept, 150–250w | Studio lookbook, ~6 looks | 11 | Yes — photographer, models, MUA, styling |
| Runway 2026 | Runway show | Show context | One look, tight small grid | 7 | Yes — show photographer |
| Selected Work | Selected work | Short intro | Four individual garments | 7 | If applicable |

Three projects, three distinct category labels — real information rather than decoration. It tells a reviewer how to read the page before they read a word of it. "Collection" and "Runway show" are deliberately different labels; if both were tagged Collection the label would stop doing any work.

### Faceted Fairytale leads

It is the only named collection and the only professionally photographed one — Sony A7 III, Lightroom-edited, white seamless, five models — so it carries the site. Concretely: it is the hero image on Home, the feature card on Work, and reachable in one hop from anywhere.

There is also a quiet piece of luck in the name. *Faceted* means gem cuts, leaded glass panels, Deco geometry — and the ornament divider is already a faceted lozenge, so the lead collection's name and the site's one motif rhyme without contrivance. **Decision: the lozenge stays a divider and does not become a wordmark.** Maddie may well want to draw her own mark, and that is hers to own rather than inherit from her developer; the rhyme is there for free either way.

**Removed: the pattern-making and couture-draping pages.** Their Drive folders turned out to hold finished garments being modelled, not technical evidence — two photos of a classroom outfit and one iPhone screenshot of a black dress. Those garments moved to Selected Work, where they always belonged. A page promising drafted patterns and toiles that delivers modelling shots damages her more than not having the page at all. The standalone Process page from the first draft stays removed for the same reason: there is nothing to put on it.

**Slugs are permanent, display titles are free.** Maddie can rename any project's heading at any time at no cost. Changing a *slug* after launch breaks every shared link, so the URLs above should be agreed once and left alone. The slugs deliberately describe content rather than course names, so they survive a rename.

Relationships: Home is a curated pitch — hero, Faceted Fairytale at full size, then Runway 2026 and Selected Work. Work is the complete catalogue in uniform treatment. At three projects these two pages risk becoming near-duplicates, so Home leads hard with the collection while Work treats all three evenly. Each project page links to the next at its foot. Contact details also sit in the sitewide footer, so the Contact page is never the only route.

**Attribution note.** The collection poster in the original photo set credits *American River College* and dates the show 27 May 2025. Per client confirmation the site describes Maddie as an SFSU senior, and that image is excluded from the build (parked in `assets/originals/_parked/dropped/`). Recorded here because it is the one factual claim on the site that the assets do not corroborate.

---

## 3. Style guide — locked

### Direction

Drawn from **Biba** (Barbara Hulanicki's 1970s London label) as general direction only: the 1970s fusion of Art Deco geometry with Art Nouveau line work, jewel tones, and gilded, stained-glass depth.

Explicitly not in scope: Biba's monogram, logotype, or trade dress. Those are trademarked. This is original work in that spirit.

### Palette — the hybrid *(selected)*

Two zones. The Biba richness carries the chrome; the work sits on bone so garment colour reads true.

**Zone 1 — Chrome (dark).** Nav, Home hero, project page headers, section dividers, footer.

| Role | Hex | Verified |
|---|---|---|
| Ink · ground | `#17101B` | — |
| Surface · raised | `#241A2B` | — |
| Bone · text | `#F3E9DB` | 15.53:1 on ink · 13.91:1 on surface — AAA |
| Muted · captions | `#B5A49E` | 7.78:1 on ink — AAA |
| Gold · accent | `#D9A93A` | 8.60:1 on ink · 7.70:1 on surface — AAA |
| Rose · accent | `#E08C97` | 7.43:1 on ink — AAA |
| Oxblood · **fill only** | `#8C2F3F` | 2.30:1 as text — fails. Bone *on* it = 6.74:1 (AA; buttons yes, nav no) |

**Zone 2 — Reading & galleries (light).** Work index body, all three project page bodies, About, Contact.

| Role | Hex | Verified |
|---|---|---|
| Bone · ground | `#F6F1E7` | — |
| White · raised | `#FFFFFF` | — |
| Ink · text | `#241A20` | 15.00:1 on bone · 16.89:1 on white — AAA |
| Muted · captions | `#544649` | 7.94:1 on bone — AAA |
| Oxblood · accent | `#7A2A38` | 8.42:1 on bone · 9.48:1 on white — AAA |
| Antique gold · accent | `#5E4A0F` | 7.58:1 on bone — AAA |
| Bright gilt · **decorative only** | `#C9A227` | 2.15:1 on bone — fails 3:1 too |

**Build rule — gilt carries no information on light grounds.** `#C9A227` at 2.15:1 fails the text threshold *and* the non-text threshold, so a thin bright-gold rule or icon on bone is near-invisible to a low-vision visitor. No gold-only current-page marker, no gold-only link colour, no gold-only icon without a label. Where gold must say something on bone it becomes antique gold `#5E4A0F`. On the dark zone, gold is unrestricted.

**Two zone decisions, made deliberately:**

- **Nav and footer are always dark, on every page.** They bookend each page in a constant band of the Biba identity, and it means one verified set of nav contrasts instead of two. An adaptive nav would double the contrast surface and invite exactly the kind of bug that only shows up on one page.
- **The ornament divider marks every zone boundary.** A hard edge from `#17101B` to `#F6F1E7` is abrupt; the Deco/Nouveau rule is what makes the transition deliberate. This is the one place pure decoration earns its keep.

### Typography — Pairing 1 *(selected)*

**Abril Fatface** (display) with **Karla** (body). 1970s fat-face revival against a clean grotesque.

| Level | Size | Face |
|---|---|---|
| Display | `clamp(2.5rem, 7vw, 5rem)` | Abril Fatface |
| H1 | `clamp(2rem, 5vw, 3.25rem)` | Abril Fatface |
| H2 | `clamp(1.75rem, 3vw, 2.25rem)` | Abril Fatface |
| H3 | `1.25rem` | **Karla 600** |
| Body | `1.0625rem` (17px) | Karla 400 |
| Small / caption | `0.875rem` | Karla 400 |

**Build rule — Abril has a floor of 28px.** Fat faces fall apart at small sizes: the thin strokes disappear and the counters fill in. So Abril is display, H1 and H2 only; H3 and everything below is Karla 600. Note that H2's minimum was raised from `1.5rem` to `1.75rem` (28px) specifically so Abril never renders below its floor at any viewport — that is why the scale is not a clean doubling.

Line-height 1.6 body / 1.15 headings. Measure capped at `65ch`. All sizes in `rem` so browser text resizing keeps working.

**Fonts are self-hosted**, not loaded from the Google Fonts CDN: latin-subset `.woff2` in the repo, `font-display: swap`, with the Abril face preloaded since it renders in the hero. Self-hosting is faster than a third-party connection and removes a request to Google from every visitor.

### Spacing scale

`4 · 8 · 16 · 24 · 32 · 48 · 64 · 96 · 128px` as custom properties `--space-1` … `--space-9`. One scale, no off-scale values.

### Component inventory

Built once, reused everywhere. This list seeds `STYLEGUIDE.md` in Phase 3 and is the most important section here for consistency:

1. **Skip link** — first focusable element on every page
2. **Nav** (dark) — wordmark + 4 links; collapses to a toggle below 600px; `aria-current="page"` plus a non-colour marker
3. **Footer** (dark) — contact, socials, year
4. **Button** — primary (oxblood fill) / ghost (outlined), 44px min touch target
5. **Project card** — image, title, category label, year; two variants, feature (full-width) and standard; used on Home and Work
6. **Category label** — the `Collection` / `Runway show` / `Selected work` pill
7. **Image grid** — CSS Grid, reflows 1 / 2 / 3 columns
8. **Lightbox** — keyboard-complete, focus-trapped
9. **Section header** — eyebrow + heading + optional intro
10. **Documentary grid** — matted, captioned images at a tighter grid than the lookbook; used by Runway 2026 and Selected Work (§5)
11. **Credits block** — definition list; Faceted Fairytale and Runway 2026 only
12. **Ornament divider** — original Deco lozenge between two Nouveau leaf forms; marks zone boundaries; `aria-hidden`
13. **Caption** — image caption plus material/technique note
14. **Pill/tag** — materials and techniques

JS conventions: one `defer`-loaded `main.js`; `initNav()`, `initLightbox()`. No framework, no dependencies. Whole-site JS budget roughly 120–150 lines.

---

## 4. Responsive breakpoints

| Name | Width | Notes |
|---|---|---|
| Mobile | ≤ 599px | Base styles. Single column. Nav collapsed |
| Tablet | 600–899px | 2-column grids, nav expands |
| Desktop | ≥ 900px | Feature card full-width, remaining two at 2 columns |
| Wide | ≥ 1400px | Container caps at 1320px so lookbook images do not stretch and lose their crop |

Per-page handling:

- **Work index — three cards.** **Faceted Fairytale takes a full-width feature card, with Runway 2026 and Selected Work side by side beneath it.** Tiles cleanly at every width (1 + 1 + 1 on mobile, 1 + 2 from tablet up), and it is editorially right: the only named, professionally shot collection should not be one of three equal tiles. This is the same feature-card pattern designed for five projects — it survived the count change unaltered, which is a good sign it was the right shape.
- This also means the site needs no 3-column grid at all, which removes a whole breakpoint's worth of CSS. Two columns at 1320px gives roughly 650px cards — considerably better for garment photography than three narrow ones.
- **Lookbook:** 1 col mobile → 2 col tablet+, selected full-bleed images breaking the grid at desktop
- **Runway 2026 grid:** 2 columns on mobile, 3 from tablet up, each image capped near **500px display width**. The sources are 532×800, so anything larger upscales and softens. That ceiling is set by the assets, not by taste — see §5
- **Nav:** toggle below 600px
- **Credits block:** stacked mobile → two-column definition list at tablet+

---

## 5. Feature list

Everything is static. Nothing needs a server.

**Sitewide:** dark nav + mobile toggle (JS), skip link, dark footer, focus-visible styling, ornament dividers at zone boundaries, `prefers-reduced-motion` honoured throughout.

**Home:** hero look from Faceted Fairytale (eager, `fetchpriority="high"`), name + one-line positioning, Faceted Fairytale at full size, then Runway 2026 and Selected Work, routes to Work and Contact.

**Work:** Faceted Fairytale as a full-width feature card, then Runway 2026 and Selected Work at 2 columns, all with category labels.

**Project pages** (one template, three instances, modules per the §2 table): dark header with title, year and category label; statement; gallery → lightbox; materials & techniques pills; credits where applicable; next-project link. **No process module** — there is nothing to put in it.

**About:** bio, education (SFSU), skills — patternmaking, draping, grading, industrial machines, knitwear, Clo3D, Illustrator, InDesign — awards.

**About has no portrait.** The only candidate in the asset set was the poster photo, excluded per the §2 attribution note. A page about a person with no picture of that person is a weak page, so this needs one headshot from Maddie — the cheapest possible ask, and the one with the highest return. Failing that, one of the self-modelled Selected Work images can double as a portrait, though it is a compromise.

**No CV and no PDF download** *(confirmed — the CV does not exist and is out of scope)*. Two consequences worth stating rather than leaving implicit: the skills list on About is now the *only* place a recruiter can read her capabilities as text, so it earns real space instead of a throwaway line; and Contact carries more weight as the single conversion point, since there is no document for someone to take away. If a CV appears later it drops onto About with no restructuring — but it must then follow the §7 rule about phone numbers and addresses.

**Contact:** lightly obfuscated `mailto:` (friction against naive scrapers, not protection — worth being honest about that), Instagram, LinkedIn, availability line.

**JavaScript in full:** nav toggle; lightbox (Esc, ←/→, focus trapped, focus restored to the triggering thumbnail on close, `aria-modal="true"`). Lazy loading is native `loading="lazy"`. That is the entire JS surface.

### Photography — the audit

The Drive set was inventoried image by image before any page was designed. **26 stills and 4 videos** — not the 75–120 the first draft assumed. That single fact drove the restructure in §2.

| Project | Stills | Source | Resolution | Verdict |
|---|---|---|---|---|
| Faceted Fairytale | 11 | Sony A7 III, Lightroom | 1624×2436 → 4000×6000 | Professional. Carries the site |
| Runway 2026 | 7 | unknown, EXIF absent | 532×800 | One look. Downscaled re-saves |
| Selected Work | 7 | phone (Samsung, iPhone) | 1620×1080 → 4000×3000 | Four garments, casual settings |
| About | 0 | — | — | No portrait exists |

Findings that changed the plan:

- **There is no process documentation anywhere.** No flats, no toiles, no drafted patterns. The folders named `advanced-pattern-making` and `cotoure-draping` hold finished garments being modelled. Two pages were removed as a result (§2), and this is the portfolio's biggest gap (§1).
- **Runway 2026 is one look, not a collection** — seven angles of a single peach organza dress over red lace. Those files also carry no EXIF at all while every other camera file does, which means they are downscaled exports rather than originals. At 532×800 they sit below the site's smallest 640px derivative, so that page gets a tight grid capped near 500px and no hero. Originals would fix it instantly if they ever surface.
- **`draping.png` is an iPhone screenshot** — iOS status bar and photo filmstrip baked in. It must be cropped to the photo area before it goes anywhere near the site.
- **EXIF is a confirmed risk, not a theoretical one.** `maddie-1.jpg` carried live GPS coordinates resolving to a residential address. `-strip` is mandatory.
- **Videos are parked, not discarded** — four `.mov` totalling ~99MB in `assets/originals/_parked/video/`. `jacket.mov` alone is 69MB and unservable as-is, but a draping or flats video is the fastest available way to close the process gap if that is ever revisited.

### Two registers

Mixed image quality is the most common way a student portfolio undermines itself, and the usual mistake is disguising it by presenting everything at the same heroic scale — which only makes the weaker images look like failed hero shots. The fix is to change the **register** per project:

- **Faceted Fairytale — editorial.** Large, full-bleed permitted, minimal captioning. The images carry themselves.
- **Runway 2026 and Selected Work — documentary.** Tighter uniform grid, consistent crops, no full-bleed, captions doing real work. Not a downgrade, and not to be apologised for: a clear, well-captioned photograph of a finished garment *is* the correct presentation of that garment. The same photo blown up full-bleed just reads as a bad photo.
- **Normalise inconsistent backgrounds.** Each documentary image sits on the `#FFFFFF` surface with consistent padding, so shots taken in a classroom, a bedroom and on a street read as a deliberate series rather than a pile.
- **Crop, do not stretch.** Casual photos carry too much dead room. Consistent aspect-ratio crops fix more than any filter will.
- Captions say *what the garment is and what it demonstrates* — the same discipline as the alt text in §8, usually the same sentence.

### Image pipeline

Photography lives in Drive; Render serves static files from the git repo. So images must be downloaded, processed, and committed — **Drive access would not remove that step**, which is why not having it costs nothing here. Per source image:

1. **Strip EXIF** (§7 — this matters more now that the originals are camera and phone files)
2. **Crop** to the project's aspect ratio
3. **Resize** to 640 / 1280 / 2000px wide
4. **Encode WebP**, with a JPEG fallback
5. **Commit the derivatives only** — originals stay out of the repo via `assets/originals/` in `.gitignore`

**Verified tooling gap:** this machine cannot currently produce WebP at all. `ffmpeg` is built without libwebp, `sips` reads WebP but cannot write it, and there is no ImageMagick, `cwebp`, or `exiftool`. Homebrew is present, so one install closes it:

```
brew install imagemagick
```

ImageMagick covers resize, crop, WebP encoding and `-strip` for EXIF in a single tool, which is why it beats installing `webp` and `exiftool` separately.

**Handoff:** download the Drive folder as a zip (Drive → folder → Download), unzip into `assets/originals/<project-slug>/`, and the pipeline script takes it from there.

---

## 6. Data model

**Not applicable** — static site, no database. Confirmed: nothing needs gating, so this stays out.

---

## 7. Security checklist

- [ ] No secrets in source or git history; `.gitignore` correct from the first commit
- [ ] HTTPS confirmed in production — automatic on Render; confirm the certificate on `grandmamaddiedesigns.com` before calling it deployed
- [ ] No mixed content
- [ ] External links get `rel="noopener noreferrer"`
- [ ] Zero dependencies — nothing to audit, no supply chain
- [ ] **Strip EXIF from every image before committing.** Camera originals carry GPS coordinates, camera serial numbers, and sometimes the photographer's name. This is now a live risk rather than a theoretical one: the technical work is documented casually, which in practice means phone photos taken wherever the work happened — a studio, a classroom, someone's apartment — each carrying the coordinates of that place. Publishing them unstripped publishes where Maddie lives and works. It is a pipeline step (§5), not a reminder.

**Not applicable:** the public-CV rule. There is no CV and no PDF download *(confirmed)*. Kept on record because it applies the moment one is added.

Not applicable, and worth stating rather than leaving blank: server-side validation, NoSQL injection, rate limiting, CORS, sessions and auth. There is no server, no database, no user input.

**Recommendation against an embedded Instagram feed:** a third-party script, tracking on Maddie's visitors, a layout that breaks when the API changes, and a real performance cost — in exchange for what a linked icon delivers just as well.

---

## 8. Accessibility commitments

WCAG 2.1 AA sitewide, AAA on nav per `accessibility.md`. All colour values in §3 are verified, not eyeballed.

- **Alt text is the largest content task.** Every garment image gets genuine descriptive alt text — silhouette, fabric, colour, notable construction ("floor-length bias-cut silk slip in oxblood, cowl neck, self-covered buttons at the back") — never a filename, never `"dress"`. Decorative ornament gets `alt=""`. The real figure is **25 images across three projects** (§5), not the 75–120 first estimated — which turns this from a slog into an afternoon. **Mikey writes the alt text** *(confirmed)*.
- **Garment alt text needs garment vocabulary.** "A dress" conveys nothing. Silhouette, fabric, construction: "peach organza shift over red lace tights, gathered cap sleeves." Where the vocabulary is uncertain, ask Maddie rather than guess — a wrong fabric name on a fashion portfolio is worse than a plain description.
- **Lightbox to full spec:** Esc, arrow keys, `aria-modal="true"`, focus trapped while open, focus returned to the triggering thumbnail on close. Mouse-only lightboxes are the most common accessibility failure on portfolio sites.
- **Nav at AAA** — verified above; current page marked with `aria-current="page"` *and* a visual rule, never colour alone.
- **Gilt carries no information on light grounds** — the 2.15:1 finding, enforced as a build rule.
- **No hover-only interactions.** If a card reveals its title on hover at desktop, that title is permanently visible on touch.
- **`prefers-reduced-motion`** respected on every transition.
- **Zoom to 200%** without overlap or clipping, checked per section.
- **Runway video**, if any, gets captions where it has meaningful audio and never autoplays with sound.

---

## 9. Open questions

**All previously open questions are answered.** Resolved: palette (hybrid), type (Pairing 1), name, domain, five-project list, Faceted Fairytale spelling and separateness, no private work, no self-serve editing after handoff, no wordmark, no deadline, Mikey writes alt text, no CV or PDF, photography exists for all five with the technical work documented casually.

### Carried forward — placeholders that ship, then get revisited

Neither of these blocks anything. Both are content, not structure, and both are cheap to change after launch because the slugs do not move.

1. **Runway 2026's real title.** No collection name is known for it. It ships as *Runway 2026* with the `Runway show` label. Worth asking Maddie for one sentence on what it actually is when convenient, so the statement module says something true rather than something generic — but a runway show titled by its year and venue is perfectly legitimate as a permanent answer, not just a placeholder.
2. **Selected Work's title.** Confirmed as genuinely non-cohesive one-off designs, so a category name is the honest framing rather than a cop-out. Ships as *Selected Work*; revisit with Maddie post-launch along with the rest of the tweaking pass.

### Two prerequisites before Phase 4 images

### Done since

- ~~`brew install imagemagick`~~ — installed and verified (WebP `rw+`, HEIC read).
- ~~The Drive zip~~ — unzipped, audited, and reorganised into `assets/originals/` under the three confirmed slugs.

### New, from the audit

3. **A headshot for About.** The only portrait candidate was excluded per the §2 attribution note. One photo from Maddie closes it, and it is the highest-return ask on this list.
4. **Runway 2026 originals**, if they exist. The current files are 532×800 downscaled exports and cap that page's presentation. Worth one question to whoever shot the show.
5. **Process documentation**, if any exists anywhere — flats, toiles, drafted patterns, even phone photos. It is the one thing MFA committees look for that this portfolio currently cannot show (§1).

---

## Next: Phase 3

GitHub repo per `git-workflow.md`; confirm the Render account exists before writing anything that assumes it; register `grandmamaddiedesigns.com`; write `STYLEGUIDE.md` from §3 as the source of truth.

**Phase 4 build order:** style guide foundation (tokens, type, nav, footer, ornament) → the project template proven on **Faceted Fairytale** → Home → the four remaining project pages → Work index → About → Contact. Each section explained as it is built.

The template gets built on Faceted Fairytale rather than Home deliberately, and three independent reasons now point the same way: it is the most demanding page (every module present, credits and all), it is the page the whole site points at, and it has the strongest photography — so the template gets designed against the best images rather than the weakest, and the documentary register for the technical work becomes a deliberate adaptation of a working design instead of an excuse baked into the foundation.

With no deadline, the sequencing is optimised for quality rather than for demo-ability: foundations first, the hardest page second, and the easy pages last.

**Phase 5:** tested together at all four breakpoints, keyboard-only, and at 200% zoom.
