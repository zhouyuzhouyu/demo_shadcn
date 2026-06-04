# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

A Flutter showcase app demonstrating [shadcn_ui](https://pub.dev/packages/shadcn_ui) components across 6 demo pages (Buttons, Forms, Feedback, Overlays, Display, Typography). Targets web (primary, deployed to GitHub Pages as WasmGC), plus Android/iOS.

## Commands

```bash
flutter pub get                          # install deps
flutter analyze                          # static analysis — must be zero issues
dart format .                            # format (CI gates on `--set-exit-if-changed`)
flutter test                             # run all tests
flutter test test/widget_test.dart       # run a single test file
flutter run -d chrome                    # run locally (web)
flutter build web --release --wasm       # web build as CI/Pages produce it (WasmGC + JS fallback)
```

`analyze` passing does NOT guarantee the app runs — see "Verifying changes".

## Architecture

- **Root is `ShadApp`, not `MaterialApp`** ([lib/main.dart](lib/main.dart)). Theming comes from `ShadThemeData` with `ShadZincColorScheme` (light + dark).
- **Pages mix Material chrome with shadcn content.** Each page in [lib/pages/](lib/pages/) uses a Material `Scaffold` + `AppBar` and `Navigator.push(MaterialPageRoute(...))` for navigation, but the page *content* is built from `shadcn_ui` widgets (`ShadCard`, `ShadButton`, `ShadInput`, …).
- **Colors/spacing read from the Shad theme**, not Material's: `final theme = ShadTheme.of(context);` then `theme.colorScheme.background / foreground / border`. Follow this when adding UI.
- **All UI work must follow the approved theme spec** in [docs/2026-06-04-flutter-theme-handoff.md](docs/2026-06-04-flutter-theme-handoff.md): shadcn_ui "Lime" preset, DM Sans font (PingFang SC fallback), Remix Icon, base radius `0.45rem`, accent = soft Lime tint (never dark green), selection = near-black fill. Read it before changing colors, typography, spacing, or icons.
- [lib/pages/home_page.dart](lib/pages/home_page.dart) is the entry list; each demo page is self-contained and independent (no shared state), typically using a private `_buildSectionTitle` helper to separate component sections.

## shadcn_ui version gotchas

The package's API changed significantly across versions; this repo is pinned to **`shadcn_ui: ^0.53.6`**. When adding/editing components, treat the **installed source as the API source of truth** (`~/.pub-cache/hosted/pub.dev/shadcn_ui-0.53.6/lib`) rather than memory — class and parameter names differ from older docs/examples. Known specifics already applied here:

- `ShadButton` icons use `leading`/`trailing` (not `icon`); icon-only buttons use `ShadIconButton`. There is no `ShadButtonSize.icon`.
- `ShadInput` affixes are `leading`/`trailing` (not `prefix`/`suffix`).
- `ShadSeparator` uses named constructors `.horizontal()` / `.vertical()`.
- **A `ShadSeparator.vertical()` must be wrapped in `IntrinsicHeight`** when placed in an unbounded-height `Row` — otherwise it requests infinite height and the subtree silently fails to render in release web builds (analyze/compile will NOT catch this).
- Do not bump `shadcn_ui` below ~0.39 with the current Flutter SDK: older versions require `intl ^0.19` which conflicts with `flutter_localizations` (pins `intl 0.20.2`).

## Verifying changes

Static checks miss runtime/layout bugs (the cloud "Claude Code Review" reads diffs, it does not compile). Before declaring a UI change done: `flutter build web` to confirm it compiles, then actually run it (release web swallows layout exceptions, rendering blank instead of a red error box).

## CI/CD & automation (`.github/workflows/`)

- **Flutter version is pinned to `3.35.6`** in [ci.yml](.github/workflows/ci.yml) and [deploy-pages.yml](.github/workflows/deploy-pages.yml) via `FLUTTER_VERSION`. Keep both in sync when upgrading.
- [ci.yml](.github/workflows/ci.yml): `analyze-and-test` runs on every push/PR; `build-web` and `build-apk` run **only on push to `main`** (`if: github.event_name == 'push'`).
- [deploy-pages.yml](.github/workflows/deploy-pages.yml): on push to `main`, builds web with `--wasm --base-href /demo_shadcn/` and deploys to GitHub Pages → https://zhouyuzhouyu.github.io/demo_shadcn/.
- [claude.yml](.github/workflows/claude.yml): auto-responds to newly opened issues; otherwise triggers on `@claude` mentions in comments/reviews.
- [claude-code-review.yml](.github/workflows/claude-code-review.yml): auto-reviews PRs (posts inline comments via `--comment`). **The Claude GitHub App requires this workflow file to be byte-identical on the PR branch and `main`** — changes must land on `main`, or the OIDC token exchange fails with a 401 validation error. Code review only runs on PRs, never on direct pushes.
