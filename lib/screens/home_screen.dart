import 'package:flutter/material.dart';
import 'package:toku_app/screens/family_member_screen.dart';
import 'package:toku_app/screens/numbers_screen.dart';

import '../models/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
      title: "Numbers",
      subtitle: "Learn counting in German",
      color: Color(0xfff09137),
      icon: Icons.looks_one,
      widget: NumbersScreen(),
    ),
    CategoryModel(
      title: "Family Members",
      subtitle: "Learn family vocabulary",
      color: Color(0xff578a36),
      icon: Icons.family_restroom,
      widget: FamilyMemberScreen(),
    ),
    CategoryModel(
      title: "Colors",
      subtitle: "Learn color names",
      color: Color(0xff79329f),
      icon: Icons.palette,
      widget: NumbersScreen(),
    ),
    CategoryModel(
      title: "Phrases",
      subtitle: "Learn common phrases",
      color: Color(0xff50acc9),
      icon: Icons.chat_bubble,
      widget: NumbersScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfffff4db), Color(0xfffef5e0), Color(0xfffdf6e3)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff48302c), Color(0xff5d3c37)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.school, color: Colors.white, size: 28),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Toku",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          "Learn Japanese",
                          style: TextStyle(fontSize: 13, color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.8),
                      Colors.white.withOpacity(0.6),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    Icon(Icons.waving_hand, color: Color(0xfff09137), size: 32),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff48302c),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Choose a category to start learning",
                          style: TextStyle(
                            fontSize: 13,

                            color: Color(0xff48302c).withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff48302c),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) =>
                      BuildCategoryItem(categoryModel: categories[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
