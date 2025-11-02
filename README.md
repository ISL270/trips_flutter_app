# Trips Flutter App

<div align="center">
  <img src="https://img.shields.io/badge/Dart-3.9.2-0175C2.svg?logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Riverpod-3.0-15A6C7.svg" alt="Riverpod 3.0">
  <img src="https://img.shields.io/badge/Material-3-673AB7.svg" alt="Material 3">
  <img src="https://img.shields.io/badge/flutter__gen-Assets-3EAAAF.svg" alt="flutter_gen">
  <img src="https://img.shields.io/badge/tests-26%20passing-brightgreen.svg" alt="Tests">
  <img src="https://img.shields.io/badge/architecture-Clean%20Architecture-blue.svg" alt="Clean Architecture">
</div>

A responsive trips management app built with Flutter, implementing a clean, feature-first architecture and modern state management via Riverpod 3.0 with code generation. The UI follows Material 3, uses type-safe assets via flutter_gen, and adapts gracefully between mobile and desktop layouts.

## 🌐 Live Demo

### [Try trips_flutter_app on GitHub Pages](https://isl270.github.io/trips_flutter_app/) 🚀

<img src="assets/GIFs/demo.gif" alt="Trips App Demo" style="object-fit: cover;">

## Features

- 🧭 **Responsive Layout**: Mobile and Desktop adaptive UI
- 🧩 **Feature-First Architecture**: Clear domain/data/presentation boundaries for the `trips` feature
- 🧠 **Riverpod 3.0 (codegen)**: Type-safe providers and notifiers with async initialization patterns
- 🎨 **Material 3 Theming**: Centralized theme and typography (Inter), no hardcoded styles
- 🖼️ **Type-Safe Assets**: `flutter_gen`-generated `assets.gen.dart` for SVGs and images
- 🧪 **Testing-Ready**: Provider overrides and widget tests aligned with Riverpod best practices

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── app/
│   ├── core/                 # Shared core functionality
│   │   ├── constants/        # App-wide constants & generated assets
│   │   ├── theme/            # Material 3 theme configuration
│   │   ├── utils/            # Responsive helpers and extensions
│   │   └── widgets/          # Reusable UI components
│   └── features/             # Feature-first modules
│       └── trips/            # Trips feature
│           ├── domain/       # Entities and repository contracts
│           ├── data/         # Remote sources and DTOs
│           │   └── remote/
│           └── presentation/ # Riverpod providers, widgets, pages
```

## Development

### Architecture Overview

- **Clean, feature-first structure**
  - Data: remote DTOs and sources
  - Domain: pure business logic (entities, repository contracts)
  - Presentation: Riverpod notifiers, widgets, screens

#### Core Components
- **TripsRepository**: Retrieves trips (backed by remote source; uses `trips_mock.json` declared in `pubspec.yaml`)
- **Riverpod Notifier**: `tripsProvider` with async initialization
- **Responsive UI**: `MobileAppBar` and `WebAppBar` with desktop TabBar
- **Reusable Widgets**: `ProfileAvatar`, `SvgIcon`, `CircularIconButton`, `VerticalDividerLine`
- **Theming**: Material 3 dark theme, Inter typography, centralized color scheme
- **Assets**: `assets.gen.dart` via flutter_gen for type-safe asset access

### AI-Driven Tooling & Workflow
- Leveraged next-gen, **AI-accelerated development environment** **(Windsurf)** throughout this project, pairing it with emerging engineering practices to boost throughput and streamline complex workflows.

## Data Refinements (`trips_mock.json`)
- Replaced the Tokyo trip cover image with a functioning Unsplash URL to avoid broken assets.
- Migrated avatar sources from `randomuser.me` to `avatar.iran.liara.run` for reliable cross-platform loading.
- Diversified participant lists—no longer capped at four—to better mirror real-world team sizes.
- Shifted all trip schedules from generic January 2024 values to bespoke 2025 ranges so the timeline feels realistic.
- Adjusted unfinished task counts to reflect varied project states (instead of static 4).