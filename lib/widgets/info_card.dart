import 'package:flutter/cupertino.dart';
import 'package:toku_app/utils/app_colors.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            AppColors.white.withOpacity(.7),
            AppColors.white.withOpacity(.5),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(CupertinoIcons.info, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Tap the play button to hear pronunciation",
              style: TextStyle(
                color: AppColors.darkBrown,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
