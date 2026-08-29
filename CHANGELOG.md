# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Initial repository scaffolding: mdbook site skeleton, landing page, and `book.toml`.
- `scripts/generate.sh` — downloads a `prima` binary (or uses a local one) and
  regenerates the per-module stdlib reference pages from `prima doc --stdlib`.
- `scripts/check-and-generate.sh` — workflow entry point that regenerates only when a
  newer `prima` release exists than the stored version stamp.
- GitHub Actions: `deploy.yml` (scheduled + manual generation and GitHub Pages deploy)
  and `ci.yml` (validates generated docs and the mdbook build on PR/push).
