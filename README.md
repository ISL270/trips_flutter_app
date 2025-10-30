# trips_flutter_app

A Flutter application for managing travel trips with participants and itineraries.

## Features

- Trip management with status tracking
- Participant avatars and profiles
- Modern Material 3 design
- Cross-platform support (iOS, Android, Web)

## Avatar Service

This project uses **[avatar.iran.liara.run](https://avatar.iran.liara.run)** for generating user avatars instead of `randomuser.me`.

**Reason:** The original `randomuser.me` API does not support CORS (Cross-Origin Resource Sharing), which prevents images from loading in Flutter web applications. The `avatar.iran.liara.run` service provides:
- Full CORS support for web applications
- Consistent avatar generation based on username
- Works across all platforms (iOS, Android, Web)
- Male/female avatar variants

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
