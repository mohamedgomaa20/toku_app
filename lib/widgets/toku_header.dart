import 'package:flutter/material.dart';
import 'package:toku_app/screens/about_screen.dart';
import 'package:toku_app/utils/app_colors.dart';

class TokuHeader extends StatelessWidget {
  const TokuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.appBarGradientWidget,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.school, color: AppColors.white, size: 28),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/logo_1.png",
                width: 80,
                color: AppColors.white,
              ),

              // Text(
              //   "Toku",
              //   style: TextStyle(
              //     fontSize: 26,
              //     color: AppColors.white,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 1,
              //   ),
              // ),
              const SizedBox(height: 5),
              const Text(
                "Learn Japanese",
                style: TextStyle(fontSize: 13, color: AppColors.white70),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
            icon: const Icon(Icons.info_outline, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
