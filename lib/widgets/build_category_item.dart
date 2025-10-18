import 'package:flutter/material.dart';

import '../models/category_model.dart';

class BuildCategoryItem extends StatelessWidget {
  const BuildCategoryItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => categoryModel.widget),
        );
      },
      child: Container(
        height: 95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [categoryModel.color, categoryModel.color.withOpacity(0.8)],
          ),

          boxShadow: [
            BoxShadow(
              color: categoryModel.color.withOpacity(.5),
              blurRadius: 15,
              offset: Offset(0, 8),
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
                  color: Colors.white.withOpacity(0.1),
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
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.25),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      categoryModel.icon,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          categoryModel.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          categoryModel.subtitle,
                          style: TextStyle(
                            fontSize: 13,

                            color: Colors.white.withOpacity(.85),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
