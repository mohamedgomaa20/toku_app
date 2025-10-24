import 'package:flutter/material.dart';
import 'package:toku_app/utils/app_colors.dart';

import '../models/user_model.dart';

class NameAndJobTitleSection extends StatelessWidget {
  const NameAndJobTitleSection({super.key, required this.userDeveloper});

  final User userDeveloper;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },

      child: Column(
        children: [
          Text(
            userDeveloper.developerName,
            style: const TextStyle(
              color: AppColors.darkBrown,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: AppColors.aboutGradientWidget,
              boxShadow: [
                BoxShadow(
                  color: AppColors.orange.withOpacity(.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Text(
              userDeveloper.joTitle,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
