import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

import '../models/number_model.dart';
import '../widgets/build_item.dart';

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
                padding: EdgeInsets.all(16),
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
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(.2),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.looks_one, color: Color(0xfff09137), size: 28),
                    SizedBox(width: 10),
                    Text(
                      "Numbers",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xfff09137).withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xfff09137).withOpacity(.5),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.list, color: Colors.white, size: 16),
                          SizedBox(width: 5),
                          Text(
                            "${numbers.length}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(.7),
                      Colors.white.withOpacity(.5),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xfff09137).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        CupertinoIcons.info,
                        color: Color(0xfff09137),
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Tap the play button to hear pronunciation",
                        style: TextStyle(
                          color: Color(0xff48302c),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: numbers.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => BuildItem(
                    item: numbers[index],
                    itemType: "numbers",
                    colorOne: Color(0xfff09137),
                    colorTwo: Color(0xfff5a855),
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
