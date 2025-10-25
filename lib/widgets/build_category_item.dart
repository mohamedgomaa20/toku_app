import 'package:flutter/material.dart';
import 'package:toku_app/utils/app_colors.dart';

import '../models/category_model.dart';

class BuildCategoryItem extends StatefulWidget {
  const BuildCategoryItem({
    super.key,
    required this.categoryModel,
    required this.delay,
  });

  final CategoryModel categoryModel;
  final int delay;

  @override
  State<BuildCategoryItem> createState() => _BuildCategoryItemState();
}

class _BuildCategoryItemState extends State<BuildCategoryItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutBack,
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(opacity: _opacityAnimation.value, child: child),
          ),
        );
      },
      child: GestureDetector(
        onTapDown: (details) => setState(() {
          _isPressed = true;
        }),
        onTapUp: (details) => setState(() {
          _isPressed = false;
        }),
        onTapCancel: () => setState(() {
          _isPressed = false;
        }),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.categoryModel.widget,
            ),
          );
        },
        child: AnimatedScale(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutBack,
          scale: _isPressed ? 0.95 : 1.0,
          child: Container(
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  widget.categoryModel.color,
                  widget.categoryModel.color.withOpacity(0.8),
                ],
              ),

              boxShadow: [
                BoxShadow(
                  color: widget.categoryModel.color.withOpacity(.5),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  top: -20,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: -30,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white.withOpacity(0.08),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(.25),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          widget.categoryModel.icon,
                          size: 32,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.categoryModel.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.categoryModel.subtitle,
                              style: TextStyle(
                                fontSize: 13,

                                color: AppColors.white.withOpacity(.85),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: AppColors.white.withOpacity(0.8),
                      ),
                    ],
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
