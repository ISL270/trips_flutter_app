import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A circular profile avatar widget with loading and error states.
///
/// Uses [CachedNetworkImage] for efficient image loading and caching.
/// Shows a loading indicator while loading, and fallback text on error.
class ProfileAvatar extends StatelessWidget {
  /// The URL of the profile image to display.
  final String imageUrl;

  /// The text to display if the image fails to load.
  /// Typically a single character or initials. Defaults to 'U'.
  final String fallbackText;

  /// The diameter of the circular avatar in pixels. Defaults to 32px.
  final double size;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    this.fallbackText = 'U',
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: size,
          height: size,
          color: Colors.grey[300],
          child: Center(
            child: SizedBox(
              width: size / 2,
              height: size / 2,
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[400]),
          child: Center(
            child: Text(
              fallbackText,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
