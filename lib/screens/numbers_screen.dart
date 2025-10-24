import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../utils/app_colors.dart';
import '../widgets/build_item.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/info_card.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  final List<Item> numbers = const [
    Item(
      imagePath: 'assets/images/numbers/number_one.png',
      sound: 'number_one_sound.mp3',
      jpName: 'Ichi',
      enName: 'one',
    ),
    Item(
      imagePath: 'assets/images/numbers/number_two.png',
      sound: 'number_two_sound.mp3',
      jpName: 'Ni',
      enName: 'two',
    ),
    Item(
      imagePath: 'assets/images/numbers/number_three.png',
      sound: 'number_three_sound.mp3',
      jpName: 'San',
      enName: 'three',
    ),
    Item(
      imagePath: 'assets/images/numbers/number_four.png',
      sound: 'number_four_sound.mp3',
      jpName: 'Shi',
      enName: 'four',
    ),
    Item(
      imagePath: 'assets/images/numbers/number_five.png',
      sound: 'number_five_sound.mp3',
      jpName: 'Go',
      enName: 'five',
    ),
    Item(
      imagePath: 'assets/images/numbers/number_six.png',
      sound: 'number_six_sound.mp3',
      jpName: 'Roku',
      enName: 'six',
    ),
    Item(
      imagePath: 'assets/images/numbers/number_seven.png',
      sound: 'number_seven_sound.mp3',
      jpName: 'Sebun',
      enName: 'seven',
    ),
    Item(
      imagePath: 'assets/images/numbers/number_eight.png',
      sound: 'number_eight_sound.mp3',
      jpName: 'Hachi',
      enName: 'eight',
    ),
    Item(
      imagePath: 'assets/images/numbers/number_nine.png',
      sound: 'number_nine_sound.mp3',
      jpName: 'Kyū',
      enName: 'nine',
    ),
    Item(
      imagePath: 'assets/images/numbers/number_ten.png',
      sound: 'number_ten_sound.mp3',
      jpName: 'Jū',
      enName: 'ten',
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
                title: "Numbers",
                color: AppColors.numbersColorOne,
                icon: Icons.looks_one,
                lengthOfList: numbers.length,
              ),
              const InfoCard(color: AppColors.numbersColorOne),
              Expanded(
                child: ListView.builder(
                  itemCount: numbers.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => BuildItem(
                    item: numbers[index],
                    itemType: "numbers",
                    delay: (index * 60).clamp(0, 300),
                    colorOne: AppColors.numbersColorOne,
                    colorTwo: AppColors.numbersColorTwo,
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
