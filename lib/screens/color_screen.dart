import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../utils/app_colors.dart';
import '../widgets/build_item.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/info_card.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  final List<Item> colors = const [
    Item(
      imagePath: 'assets/images/colors/color_black.png',
      sound: 'black.wav',
      jpName: 'Burakku',
      enName: 'black',
    ),

    Item(
      imagePath: 'assets/images/colors/color_brown.png',
      sound: 'brown.wav',
      jpName: 'Chairo',
      enName: 'brown',
    ),
    Item(
      imagePath: 'assets/images/colors/color_dusty_yellow.png',
      sound: 'dusty yellow.wav',
      jpName: 'Hokori ppoi kiiro',
      enName: 'dusty yellow',
    ),
    Item(
      imagePath: 'assets/images/colors/color_gray.png',
      sound: 'gray.wav',
      jpName: 'Gurē',
      enName: 'gray',
    ),
    Item(
      imagePath: 'assets/images/colors/color_green.png',
      sound: 'green.wav',
      jpName: 'Midori',
      enName: 'green',
    ),

    Item(
      imagePath: 'assets/images/colors/color_red.png',
      sound: 'red.wav',
      jpName: 'Aka',
      enName: 'red',
    ),
    Item(
      imagePath: 'assets/images/colors/color_white.png',
      sound: 'white.wav',
      jpName: 'Shiroi',
      enName: 'white',
    ),
    Item(
      imagePath: 'assets/images/colors/yellow.png',
      sound: 'yellow.wav',
      jpName: 'Kiiro',
      enName: 'yellow',
    ),
    Item(
      imagePath: 'assets/images/colors/color_black.png',
      sound: 'black.wav',
      jpName: 'Burakku',
      enName: 'black',
    ),
    Item(
      imagePath: 'assets/images/colors/color_brown.png',
      sound: 'brown.wav',
      jpName: 'Chairo',
      enName: 'brown',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradientWidget),
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: "Colors",
                color: AppColors.colorsColorOne,
                icon: Icons.palette,
                lengthOfList: colors.length,
              ),
              InfoCard(color: AppColors.colorsColorOne),
              Expanded(
                child: ListView.builder(
                  itemCount: colors.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => BuildItem(
                    item: colors[index],
                    itemType: "colors",
                    delay: (index * 60).clamp(0, 300),
                    colorOne: AppColors.colorsColorOne,
                    colorTwo: AppColors.colorsColorTwo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
