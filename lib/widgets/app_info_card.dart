import 'package:flutter/material.dart';
import 'package:toku_app/utils/app_colors.dart';

class AppInfoCard extends StatefulWidget {
  const AppInfoCard({
    super.key,
    required this.appIcon,
    required this.appName,
    required this.appDescription,
    required this.appVersion,
    required this.onTap,
  });

  final IconData appIcon;
  final String appName;
  final String appDescription;
  final String appVersion;
  final VoidCallback onTap;

  @override
  State<AppInfoCard> createState() => _AppInfoCardState();
}

class _AppInfoCardState extends State<AppInfoCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(50 * (1 - value), 0),
          child: Opacity(opacity: value, child: child),
        );
      },

      child: AnimatedScale(
        duration: Duration(milliseconds: 150),
        curve: Curves.bounceInOut,

        scale: isPressed ? 0.8 : 1,
        child: GestureDetector(
          onTap: widget.onTap,
          onTapDown: (details) {
            setState(() {
              isPressed = true;
            });
          },
          onTapUp: (details) {
            setState(() {
              isPressed = false;
            });
          },
          onTapCancel: () {
            setState(() {
              isPressed = false;
            });
          },

          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.7),
                  Colors.white.withOpacity(0.5),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkBrown.withOpacity(.05),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),

            child: Column(
              children: [
                Icon(widget.appIcon, size: 45, color: AppColors.darkBrown),
                SizedBox(height: 5),
                Image.asset("assets/logo_1.png", width: 120),
                // Text(
                //   widget.appName,
                //   style: TextStyle(
                //     fontSize: 22,
                //     color: AppColors.darkBrown,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(height: 15),
                Text(
                  widget.appDescription,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.darkBrown.withOpacity(.7),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Version ${widget.appVersion}",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.darkBrown.withOpacity(.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
