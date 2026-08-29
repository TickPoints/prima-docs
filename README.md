# prima-docs

Auto-generated reference documentation for the [Prima](https://github.com/TickPoints/prima-language)
standard library, published with [mdbook](https://rust-lang.github.io/mdBook/) to GitHub Pages.

The standard library of Prima is a set of embedded `.pra` signature modules plus the
builtin value classes; `prima doc --stdlib` renders each module's `///` comments into
Markdown. This repo wraps that output into a browsable site:

- **`prima-docs`** builds and deploys the site.
- A scheduled GitHub Actions workflow polls the latest `prima` release; when a newer
  version appears it downloads the prebuilt `prima` binary, regenerates the reference
  pages, commits the diff, and redeploys (manual `workflow_dispatch` also supported).

## Layout

```text
book.toml                mdbook configuration
src/
  index.md               landing page
  generated/             per-module reference pages + version stamp (generated)
scripts/
  generate.sh            download prima, run `prima doc --stdlib`, split into pages
  check-and-generate.sh  workflow entry: regenerate only when a newer release exists
.github/workflows/
  deploy.yml             scheduled + manual generation/deploy to GitHub Pages
  ci.yml                 validate generated docs and mdbook build on PR/push
```

## Local build

```bash
# Regenerate the reference pages from a local prima binary (optionally at a tag)
./scripts/generate.sh --binary /path/to/prima        # uses the latest installed build
./scripts/generate.sh --version v0.3.0               # downloads the release binary

mdbook build        # -> book/
mdbook serve        # local preview at http://localhost:3000
```

## How it works

`prima doc --stdlib` concatenates one `# Module \`name\`` section per embedded module.
`generate.sh`:

1. resolves the `prima` binary (given `--binary`, or downloaded for a `--version`/latest tag);
2. runs `prima doc --stdlib` and splits the output on `# Module` headers into
   `src/generated/<slug>.md` (`sys::path` -> `sys-path.md`);
3. writes `src/generated/modules.md` and `src/generated/classes.md` (module / builtin-class
   indexes), `src/generated/SUMMARY.md`, and stamps `src/generated/version.txt`.

`check-and-generate.sh` (used by the deploy workflow) compares the latest
`TickPoints/prima-language` release against the stored version stamp and only
regenerates when they differ, so an unchanged site is not churned.

## License

[MIT](./LICENSE)
