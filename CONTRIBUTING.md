# Contributing to melix.cl

Standards for new posts and changes to this repository. Some of these are
enforced automatically (hooks, htmlproofer, CI). Others are conventions
to keep in mind. The goal is to keep the site consistent and to never
accidentally publish identity- or security-sensitive content. This
is mainly a personal guide in case I forget about some of my own standards.

If you fork this repo, treat this as a checklist; you'll need to set up
the same hooks locally for the privacy automation to apply.

---

## New posts

### Filename and location

```
_posts/YYYY-MM-DD-slug.md
```

The slug becomes part of the URL (`/posts/<slug>/`) and is rendered as
the filename in each post's window title bar (`<slug>.md`).

### Required front matter

| Key            | Notes |
|----------------|-------|
| `title`        | Headline. Quote it if it contains `:`. |
| `date`         | `YYYY-MM-DD HH:MM:SS ±HHMM` (Chile is `-0300` or `-0400` depending on DST). |
| `description`  | One- or two-sentence summary. Used as the home-card excerpt and as `<meta name="description">`. |
| `categories`   | Max 2, in `[Top, Sub]` form. |
| `tags`         | Lowercase, hyphenated. |
| `lang`         | `en` (the site is English-only). |
| `image.path`   | `/assets/img/posts/YYYY-MM-DD-hero.png`. |
| `image.alt`    | Required. Descriptive, not generic ("image", "hero", filename). |

### Optional front matter

| Key             | Notes |
|-----------------|-------|
| `video`         | `/assets/video/YYYY-MM-DD-hover.mp4`. Plays muted on hover over the hero (post page) and over the home card. |
| `canonical_url` | Required if the post first appeared elsewhere; points back to the original publisher for SEO. |
| `last_modified_at` | Auto-set by `_plugins/posts-lastmod-hook.rb` from git history; only override if you really mean it. |

### Republished content

If a post first appeared elsewhere (e.g. Fintualist):

1. `canonical_url` in front matter pointing at the original.
2. Disclaimer callout near the top of the body, e.g.:

   ```markdown
   > Originally published on [Fintualist](https://fintualist.com/...)
   > (in Spanish, June 2025). The hero illustration first appeared on
   > that publication and is reproduced here with credit to Fintualist.
   {: .prompt-info }
   ```

3. Confirm with the original publisher that re-posting is OK. Default
   to text-only republishing; only reproduce hero artwork or third-party
   images with explicit permission.

---

## Images

### Storage

```
assets/img/posts/YYYY-MM-DD-<name>.<ext>
```

Hero images go alongside post images. Avatar lives at
`assets/img/avatar.jpg`. Favicons in `assets/img/favicons/`.

### Alt text

Every image must have alt text. Aim for *useful description*, not
filename or "image":

- ✗ `![hero image](...)`
- ✗ `![day1-1.png](...)`
- ✓ `![Vertical timeline of the six 30-day stages of the OIV qualification process: process start on May 30, sectoral technical report, …](...)`

### Privacy

Images under `assets/img/` are scrubbed automatically on every commit by
[`.husky/pre-commit`](.husky/pre-commit). Specifically:

- EXIF, IPTC, XMP, GPS coordinates, software / device tags — **all
  removed** via `exiftool -overwrite_original -all=`.
- ICC color profile — **preserved** with `--icc_profile:all=` so
  screenshots and photos keep accurate colors.
- The original (with metadata) lives briefly in your local Git object
  store between `git add` and `git commit`, then is unreachable from
  any commit and gets garbage-collected. It never leaves your machine.

### What the hook can't do

- **SVGs** are XML — embedded `<title>`, `<desc>`, and `<metadata>`
  tags need a manual audit.
- **Identifiable subjects** (faces, license plates, names visible in
  screenshots) need consent before posting. The hook can't decide that
  for you.
- **Hard-to-spot metadata in third-party files** — if a file came from
  somewhere else, run `exiftool -G -s path/to/file` and verify only
  `[File]`, `[ExifTool]`, `[Composite]` sections appear.

### Color profile note

Screenshots benefit from a preserved ICC profile. Photos from real
cameras can sometimes carry profiles that imply specific hardware; if
that's a concern for a particular file, strip with
`exiftool -all= path/to/file` (no `--icc_profile:all=`) and accept the
slight color shift.

---

## Videos

### Storage

```
assets/video/YYYY-MM-DD-hover.mp4
```

### Format and size

- MP4 (H.264) for browser support.
- Target under ~5 MB for hover videos. Compress before committing.
- Suggested ffmpeg recipe:

  ```sh
  ffmpeg -i source.mov \
    -vf "scale=1280:-2,fps=24" \
    -c:v libx264 -crf 26 -preset slow -profile:v main \
    -an \
    -movflags +faststart \
    -map_metadata -1 \
    assets/video/YYYY-MM-DD-hover.mp4
  ```

  - `-vf scale=1280:-2,fps=24` caps width at 1280 and 24 fps.
  - `-an` drops audio (videos must be silent).
  - `-map_metadata -1` strips container metadata at encode time.
  - `-movflags +faststart` puts moov atom first so the file starts
    playing before fully downloaded.

### Always muted

Videos are silent by contract. The post and home layouts add `muted`,
`defaultMuted`, and a `volumechange` listener that re-mutes if anything
flips it. Never include audio in the source.

### Privacy

Same hook applies: container-level QuickTime metadata (`CreateDate`,
`Make`, `Model`, GPS atoms…) is stripped. Verify with
`exiftool -G -s path/to/file.mp4`.

---

## Accessibility

- **Alt text** on every image. See above.
- **Heading hierarchy**: `## h2` then `### h3`; don't skip levels. The
  `_layouts/page.html` script wraps tab-page sections by heading level
  and assumes a clean hierarchy.
- **Aria labels** on interactive controls. Existing image-window
  buttons (`.iw-min`, `.iw-max`, `.iw-restore`, `.cw-*`) already have
  them. Match the pattern when adding new buttons.
- **Color is decorative**: state changes (active / hover / minimized)
  must work for someone who doesn't see color. Use border, position,
  or a label change in addition to a hue shift.

---

## Inclusion and identity

- Author pronouns are public on `/about/` (she/her, they/them).
- Posts mentioning gender-diverse experience treat it as a fact of the
  story, not the centre of every story.
- Cite collaborators by name only after explicit consent. Default to
  initials or roles otherwise.
- Avoid language that assumes a default reader (gender, location,
  background). The site is read from across Latin America, the EU, and
  the US — check that translations and idioms travel.

---

## Privacy and security boundaries

### Never commit

- Real email addresses (Git uses GitHub's noreply for commits).
- Personal phone numbers or postal addresses.
- API keys, tokens, secrets, `.env` files, private keys.
- Files containing customer or production data.
- Birth date or full government-id numbers (CL RUT, MX CURP, etc.).

### Pre-commit hooks

Two hooks run on every `git commit`:

1. **Global** at `~/.config/git/hooks/pre-commit` — runs `gitleaks` to
   scan staged changes for secrets. Aborts the commit on any hit. Then
   `exec`s into the repo-local hook below.
2. **Local** at [`.husky/pre-commit`](.husky/pre-commit) — strips
   media metadata as described above.

Required tools:

```sh
brew install exiftool gitleaks
```

The hook is executable and committed. After cloning a fresh copy of
the repo, no further setup is needed (the global hook delegates to
`.husky/pre-commit` automatically).

---

## Repository conventions

### Commits

- **Conventional commits in English.** Types: `feat`, `fix`, `chore`,
  `refactor`, `docs`, `test`, `ci`, `build`, `perf`, `revert`,
  `policy`. Optional scope in parens: `feat(posts): …`,
  `fix(home): …`.
- Subject ≤ ~70 chars. Body explains *why*, not *what* (the diff
  already shows what).
- Commits are GPG-signed via 1Password SSH signing
  (`commit.gpgsign = true`, `gpg.format = ssh`). Every commit must be
  verifiable on GitHub.

### Branches

- `main` is the deploy branch. Pushing to `main` triggers
  [`.github/workflows/pages-deploy.yml`](.github/workflows/pages-deploy.yml),
  which builds with `JEKYLL_ENV=production`, runs htmlproofer,
  deploys to GitHub Pages, and purges Cloudflare cache.
- Open-ended work goes on a feature branch, merged once tests are
  green.

### htmlproofer enforcement

The CI's "Test site" step runs htmlproofer with `--enforce-https` (the
default). Any external link with `http://` will fail the build. Use
`https://` for everything that supports it; if a target is HTTP-only,
get a HTTPS-capable replacement or the build won't ship.

---

## Code style

- **No `//` line comments inside inline `<script>` blocks** in any
  layout. Chirpy's `compress_html` strips newlines from script content
  in production — every `//` then swallows the rest of the file.
  Either use `/* */` blocks or no comment at all.
- **Default to no comments.** When you do write one, explain *why*
  (the reason a future reader will need), not *what* (the code already
  says that). The block at the top of
  [`assets/css/jekyll-theme-chirpy.scss`](assets/css/jekyll-theme-chirpy.scss)
  is a good example: it documents a foot-gun that can't be derived
  from reading the code.
- **Don't simplify the `@use` conditional** at the top of
  [`assets/css/jekyll-theme-chirpy.scss`](assets/css/jekyll-theme-chirpy.scss).
  See the comment in that file. tl;dr it's load-bearing — production
  needs `main.bundle` (Bootstrap inlined) because Chirpy's `head.html`
  only injects the Bootstrap CDN tag in non-production.

---

## Local development

```sh
bundle install
bundle exec jekyll serve --livereload
```

Then open <http://localhost:4000>.

### Gotchas

- Edits to `_config.yml` require a server restart; `--livereload` does
  not pick them up.
- Running `JEKYLL_ENV=production bundle exec jekyll build` once leaves
  a production-compressed `_site/` behind. The next `jekyll serve` will
  reuse it. Run `bundle exec jekyll clean` before resuming dev or you
  will see "broken locally" symptoms (compressed inline scripts mostly).
- Production HTML is single-line; if you're chasing a JS error reported
  at e.g. `melix.cl:1:11821`, rebuild locally with
  `JEKYLL_ENV=production` and read `_site/index.html` to find the
  offending bytes.

---

## License

- **Code** (layouts, scripts, Sass, hooks) — [MIT](LICENSE), inherited
  from the Chirpy starter.
- **Posts and photographs** — see [LICENSE-CONTENT.md](LICENSE-CONTENT.md).
