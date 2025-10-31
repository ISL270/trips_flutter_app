import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/constants/app_colors.dart';

/// Reusable circular profile avatar widget with loading and error states
/// Fixed size: 32×32px
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: 'https://avatar.iran.liara.run/public/boy?username=user8',
        width: 32,
        height: 32,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: 32,
          height: 32,
          color: AppColors.primary,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
          child: const Center(
            child: Text(
              'U',
              style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
