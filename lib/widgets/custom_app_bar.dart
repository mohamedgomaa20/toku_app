import 'package:flutter/material.dart';
import 'package:toku_app/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icon,
    required this.title,
    this.lengthOfList,
    required this.color,
  });

  final IconData icon;
  final String title;
  final int? lengthOfList;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColors.appBarGradientWidget,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white.withOpacity(.2),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: 15),
          Icon(icon, color: color, size: 28),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          if (lengthOfList != null)
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: color.withOpacity(.3),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color.withOpacity(.5), width: 1.5),
              ),
              child: Row(
                children: [
                  Icon(Icons.list, color: AppColors.white, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "$lengthOfList",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
