import 'package:flutter/material.dart';
import 'package:toku_app/utils/app_colors.dart';

class BuildContactCard extends StatefulWidget {
  const BuildContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.hasArrow = true,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool hasArrow;

  @override
  State<BuildContactCard> createState() => _BuildContactCardState();
}

class _BuildContactCardState extends State<BuildContactCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(60 * (1 - value), 0),
          child: Opacity(opacity: value, child: child),
        );
      },

      child: AnimatedScale(
        duration: Duration(milliseconds: 150),
        scale: isPressed ? 0.97 : 1,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            onHighlightChanged: (value) {
              setState(() {
                isPressed = value;
              });
            },
            borderRadius: BorderRadius.circular(20),
            splashColor: AppColors.aboutColorOne.withOpacity(0.2),
            highlightColor: AppColors.aboutColorOne.withOpacity(0.1),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    AppColors.white.withOpacity(0.7),
                    AppColors.white.withOpacity(0.5),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(.05),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: widget.hasArrow
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.aboutColorOne.withOpacity(.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.icon,
                      color: AppColors.aboutColorOne,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: widget.hasArrow ? 14 : 16,
                            color: widget.hasArrow
                                ? AppColors.darkBrown.withOpacity(0.7)
                                : AppColors.darkBrown,
                            fontWeight: widget.hasArrow
                                ? FontWeight.w600
                                : FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          widget.subtitle,
                          style: TextStyle(
                            fontSize: widget.hasArrow ? 16 : 14,
                            fontWeight: widget.hasArrow
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: widget.hasArrow
                                ? AppColors.darkBrown
                                : AppColors.darkBrown.withOpacity(0.8),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.hasArrow
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.darkBrown.withOpacity(0.3),
                          size: 18,
                        )
                      : SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
