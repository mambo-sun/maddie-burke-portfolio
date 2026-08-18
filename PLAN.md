# Maddie Burke — Portfolio Site Plan

**Status:** Phase 2 (Plan) — **complete. Every open question is answered** (§9). Ready for sign-off and Phase 3.
**Client:** Maddie Burke, senior-year fashion design major, SFSU
**Built by:** Mikey Tashjian
**Stack:** fully static — HTML / CSS / vanilla JS on Render static hosting. No Express, no MongoDB, no Brevo. **Confirmed:** nothing on the site needs to be private, so there is no reason to add a backend.
**Domain:** `grandmamaddiedesigns.com` *(client's settled choice)* — verified available via whois. `grandmamaddie.com` and `grandmamaddiedesign.com` are also free; the short one is worth registering as a redirect while it is available. Supersedes the earlier `maddieburkedesigns.com`, which was never registered.

---

## 1. Purpose & audience

A portfolio site presenting Maddie Burke's collections and construction skill to people deciding whether to hire, admit, or commission her.

- **Design directors / hiring managers**, often skimming on a phone
- **MA/MFA admissions committees** — these want *process* evidence, which this site now leads with rather than buries
- **Competitions, awards, press**
- **Freelance and commission enquiries**

Three consequences that drive everything below:

1. **It is a recruiting instrument.** Contact reachable in one action from any page. No deadline is driving it *(confirmed)*, which means quality over speed and no reason to cut corners for a date.
2. **Mobile is the primary viewport.** Mobile-first per `responsive-design.md`.
3. **The work is the content.** Every gram of design personality must make the garments look better, never compete with them.

---

## 2. Site map

**Revised from the first draft.** The five bodies of work are not five collections — one is the named collection, one is a runway show, two are technical coursework, one is mixed — so a single rigid "collection" template would have flattened them. See the note below.

| Page | File | Purpose |
|---|---|---|
| Home | `index.html` | Name, positioning, hero look, the two collections featured, routes to Work / Contact |
| Work | `work.html` | Complete index of all five projects — the hub |
| Faceted Fairytale | `work/faceted-fairytale.html` | **The named collection — the lead work of the site** |
| Runway 2026 | `work/runway-2026.html` | SFSU 2026 runway show — display title is a placeholder, no collection name known yet |
| Pattern making | `work/pattern-making.html` | Advanced pattern making — technical study |
| Couture draping | `work/couture-draping.html` | Couture draping — draping study |
| Selected work | `work/selected.html` | One-off designs, deliberately not cohesive — placeholder title, revisit with Maddie post-launch |
| About | `about.html` | Bio, education, skills, machines & software, awards, CV download |
| Contact | `contact.html` | Email, Instagram, LinkedIn, availability |

Spelling confirmed as **Faceted Fairytale**. Slug `faceted-fairytale`.

### Why one flexible template beats a rigid one

The five projects are different kinds of thing, and one template flexes to fit rather than forcing them into a shape that suits only the collection:

| Project | Category label | Statement | Gallery | Process module | Credits |
|---|---|---|---|---|---|
| **Faceted Fairytale** | Collection | Concept, 150–250w | Lookbook | Supporting | Yes — photographer, models, MUA, styling |
| Runway 2026 | Runway show | Show context | Runway images | Optional | Yes — show photographer |
| Pattern making | Technical study | What it demonstrates | Drafted patterns, graded sets, flats | **Dominant** | Omitted |
| Couture draping | Draping study | What it demonstrates | Toiles on the stand, hand-finishing | **Dominant** | Omitted |
| Selected work | Selected work | Short intro | Mixed | Optional | If applicable |

Five projects, five distinct category labels — and that is real information rather than decoration. It tells a reviewer how to read the page before they read a word of it: a design director skims the collection, an MFA committee slows down on the draping. Note that "Collection" and "Runway show" are deliberately different labels; if both were tagged Collection the label would stop doing any work.

### Faceted Fairytale leads

It is the only named collection, so it carries the site. Concretely: it is the hero image on Home, the first card on Work, and the page every other route should be able to reach in one hop.

There is also a quiet piece of luck in the name. *Faceted* means gem cuts, leaded glass panels, Deco geometry — and the ornament divider is already a faceted lozenge, so the lead collection's name and the site's one motif rhyme without contrivance. **Decision: the lozenge stays a divider and does not become a wordmark.** Maddie may well want to draw her own mark, and that is hers to own rather than inherit from her developer; the rhyme is there for free either way.

**The standalone Process page from the first draft is now removed.** Pattern making and draping *are* the process evidence, shown in their own context with their own framing. A separate cross-collection process page would have duplicated them and diluted both.

**Slugs are permanent, display titles are free.** Maddie can rename any project's heading at any time at no cost. Changing a *slug* after launch breaks every shared link, so the URLs above should be agreed once and left alone. The slugs deliberately describe content rather than course names, so they survive a rename.

Relationships: Home is a curated pitch — hero, the two collections at full size, then a compact row to the three remaining projects. Work is the complete catalogue of five in uniform treatment. That split is what stops the two pages from being near-duplicates of each other, which is the trap at this project count. Each project page links to the next at its foot. Contact details also sit in the sitewide footer, so the Contact page is never the only route.

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

**Zone 2 — Reading & galleries (light).** Work index body, all four project page bodies, About, Contact.

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
6. **Category label** — the `Collection` / `Runway show` / `Technical study` / `Draping study` / `Selected work` pill
7. **Image grid** — CSS Grid, reflows 1 / 2 / 3 columns
8. **Lightbox** — keyboard-complete, focus-trapped
9. **Section header** — eyebrow + heading + optional intro
10. **Process module** — captioned technical images at a tighter grid than the lookbook
11. **Credits block** — definition list, used on Runway 2026 only
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
| Desktop | ≥ 900px | Featured project full-width, remaining four at 2 columns |
| Wide | ≥ 1400px | Container caps at 1320px so lookbook images do not stretch and lose their crop |

Per-page handling:

- **Work index — five cards, which is the awkward number.** Five tiles badly: at 2 columns you get 2 + 2 + 1 with an orphan; at 3 columns you get 3 + 2 and a hole in the second row. Rather than fight it, the layout *uses* it — **Faceted Fairytale takes a full-width feature card, and the remaining four sit in a 2-column grid beneath it.** That tiles perfectly at every breakpoint (1 + 1 + 1 + 1 + 1 on mobile, 1 + 2×2 from tablet up), and it is editorially correct anyway, since the named collection should not be one of five equal tiles. The awkward count is what produced the better layout.
- This also means the site needs no 3-column grid at all, which removes a whole breakpoint's worth of CSS. Two columns at 1320px gives roughly 650px cards — considerably better for garment photography than three narrow ones.
- **Lookbook:** 1 col mobile → 2 col tablet+, selected full-bleed images breaking the grid at desktop
- **Process module:** 2 columns *even on mobile* — patterns, flats and swatches are small studies, and one-per-screen makes the page endless
- **Nav:** toggle below 600px
- **Credits block:** stacked mobile → two-column definition list at tablet+

---

## 5. Feature list

Everything is static. Nothing needs a server.

**Sitewide:** dark nav + mobile toggle (JS), skip link, dark footer, focus-visible styling, ornament dividers at zone boundaries, `prefers-reduced-motion` honoured throughout.

**Home:** hero look from Faceted Fairytale (eager, `fetchpriority="high"`), name + one-line positioning, the two collections as full-size cards, a compact row linking to the three remaining projects, routes to Work and Contact.

**Work:** Faceted Fairytale as a full-width feature card, then the remaining four at 2 columns, all with category labels.

**Project pages** (one template, five instances, modules per the §2 table): dark header with title, year and category label; statement; gallery → lightbox; process module where it applies; materials & techniques pills; credits where applicable; next-project link.

**About:** portrait, bio, education (SFSU), skills — patternmaking, draping, grading, industrial machines, knitwear, Clo3D, Illustrator, InDesign — awards.

**No CV and no PDF download** *(confirmed — the CV does not exist and is out of scope)*. Two consequences worth stating rather than leaving implicit: the skills list on About is now the *only* place a recruiter can read her capabilities as text, so it earns real space instead of a throwaway line; and Contact carries more weight as the single conversion point, since there is no document for someone to take away. If a CV appears later it drops onto About with no restructuring — but it must then follow the §7 rule about phone numbers and addresses.

**Contact:** lightly obfuscated `mailto:` (friction against naive scrapers, not protection — worth being honest about that), Instagram, LinkedIn, availability line.

**JavaScript in full:** nav toggle; lightbox (Esc, ←/→, focus trapped, focus restored to the triggering thumbnail on close, `aria-modal="true"`). Lazy loading is native `loading="lazy"`. That is the entire JS surface.

### Photography reality, and what it changes

Confirmed state: all five projects have photography in Google Drive. **Faceted Fairytale has the most professional images. The technical work — pattern making and draping — is documented casually.**

Mixed image quality is the most common way a student portfolio undermines itself, and the usual mistake is trying to disguise it by presenting everything at the same heroic scale — which only makes the weaker images look like failed hero shots. The fix is to change the **register** per project rather than pretending the quality is uniform:

- **Faceted Fairytale and Runway 2026 — editorial register.** Large, full-bleed permitted, minimal captioning, images carrying themselves.
- **Pattern making and draping — documentary register.** Tighter uniform grid, consistent sizing, no full-bleed, captions doing real work. This is not a downgrade and should not be apologised for: nobody expects a studio shot of a sloper, and a clear, well-captioned photograph of a drafted block *is* the correct presentation of a drafted block. It reads as competence. The same photo blown up full-bleed reads as a bad photo.
- **Normalise inconsistent backgrounds.** Each technical image sits on the `#FFFFFF` surface with consistent padding, so a set shot on different tables at different times reads as a deliberate series rather than a mess.
- **Crop, do not stretch.** Casual photos almost always have too much dead room around the subject. Consistent aspect-ratio crops fix more than any filter will.
- Captions on technical images say *what the piece demonstrates*, not what it is — the same discipline as the alt text in §8, and usually the same sentence.

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

- **Alt text is the largest content task.** Every garment image gets genuine descriptive alt text — silhouette, fabric, colour, notable construction ("floor-length bias-cut silk slip in oxblood, cowl neck, self-covered buttons at the back") — never a filename, never `"dress"`. Decorative ornament gets `alt=""`. Across five projects this is plausibly 75–120 images. **Mikey writes the alt text** *(confirmed)* — which makes the point below a working constraint rather than a nicety.
- **Technical images need technical alt text.** A drafted pattern or a toile is information-dense, and "a sewing pattern" conveys nothing. These need Maddie's vocabulary — what the piece demonstrates, not what it looks like.
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

3. **`brew install imagemagick`** — the machine cannot encode WebP without it (§5).
4. **The Drive zip.** Download the folder, unzip to `assets/originals/<project-slug>/`. I have no Drive access and do not need it; the files have to be local and committed either way.

---

## Next: Phase 3

GitHub repo per `git-workflow.md`; confirm the Render account exists before writing anything that assumes it; register `grandmamaddiedesigns.com`; write `STYLEGUIDE.md` from §3 as the source of truth.

**Phase 4 build order:** style guide foundation (tokens, type, nav, footer, ornament) → the project template proven on **Faceted Fairytale** → Home → the four remaining project pages → Work index → About → Contact. Each section explained as it is built.

The template gets built on Faceted Fairytale rather than Home deliberately, and three independent reasons now point the same way: it is the most demanding page (every module present, credits and all), it is the page the whole site points at, and it has the strongest photography — so the template gets designed against the best images rather than the weakest, and the documentary register for the technical work becomes a deliberate adaptation of a working design instead of an excuse baked into the foundation.

With no deadline, the sequencing is optimised for quality rather than for demo-ability: foundations first, the hardest page second, and the easy pages last.

**Phase 5:** tested together at all four breakpoints, keyboard-only, and at 200% zoom.
