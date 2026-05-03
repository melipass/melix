# melix.cl

Personal site of Melissa — a Jekyll blog and work record served from
GitHub Pages at <https://melix.cl>.

Built on the [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy)
Jekyll theme with a custom overlay: window-chrome aesthetic, draggable
and resizable image and panel windows, dark-only palette.

## Layout

```
_config.yml          Jekyll config
_layouts/            Local overrides for post.html, home.html, page.html
_includes/           Local includes (panel-window wrapper script)
_posts/              Blog posts
_tabs/               Top-level pages (about, work, archives, …)
assets/css/          Theme overlay (Sass)
assets/img/          Avatar, post images, favicons
assets/video/        Hover videos for the homepage cards
.husky/pre-commit    Hook that strips media metadata before each commit
.github/workflows/   GitHub Pages deploy via Actions
```

## Local development

Requires Ruby 3.x.

```sh
bundle install
bundle exec jekyll serve --livereload
```

Open <http://localhost:4000>.

## License

- **Code** (layouts, scripts, Sass, hooks) — [MIT](LICENSE), inherited
  from the Chirpy starter.
- **Posts and photographs** — see [LICENSE-CONTENT.md](LICENSE-CONTENT.md).
  The two posts under `_posts/` were originally written for
  [fintualist.com](https://fintualist.com) and are republished here with
  attribution; the canonical URL stays with Fintual.
