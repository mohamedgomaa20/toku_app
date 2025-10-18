import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/number_model.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  final List<Number> numbers = const [
    Number(
      imagePath: 'assets/images/numbers/number_one.png',
      sound: 'number_one_sound.mp3',
      jpName: 'Ichi',
      enName: 'one',
    ),
    Number(
      imagePath: 'assets/images/numbers/number_two.png',
      sound: 'number_two_sound.mp3',
      jpName: 'Ni',
      enName: 'two',
    ),
    Number(
      imagePath: 'assets/images/numbers/number_three.png',
      sound: 'number_three_sound.mp3',
      jpName: 'San',
      enName: 'three',
    ),
    Number(
      imagePath: 'assets/images/numbers/number_four.png',
      sound: 'number_four_sound.mp3',
      jpName: 'Shi',
      enName: 'four',
    ),
    Number(
      imagePath: 'assets/images/numbers/number_five.png',
      sound: 'number_five_sound.mp3',
      jpName: 'Go',
      enName: 'five',
    ),
    Number(
      imagePath: 'assets/images/numbers/number_six.png',
      sound: 'number_six_sound.mp3',
      jpName: 'Roku',
      enName: 'six',
    ),
    Number(
      imagePath: 'assets/images/numbers/number_seven.png',
      sound: 'number_seven_sound.mp3',
      jpName: 'Sebun',
      enName: 'seven',
    ),
    Number(
      imagePath: 'assets/images/numbers/number_eight.png',
      sound: 'number_eight_sound.mp3',
      jpName: 'Hachi',
      enName: 'eight',
    ),
    Number(
      imagePath: 'assets/images/numbers/number_nine.png',
      sound: 'number_nine_sound.mp3',
      jpName: 'Kyū',
      enName: 'nine',
    ),
    Number(
      imagePath: 'assets/images/numbers/number_ten.png',
      sound: 'number_ten_sound.mp3',
      jpName: 'Jū',
      enName: 'ten',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff48302c),
        foregroundColor: Colors.white,
        title: Text("Numbers"),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) =>
            BuildNumberItem(number: numbers[index]),
      ),
    );
  }
}

class BuildNumberItem extends StatelessWidget {
  const BuildNumberItem({super.key, required this.number});

  final Number number;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Color(0xfff09137),

      child: Row(
        children: [
          Container(
            color: Color(0xfffff4db),
            child: Image.asset(number.imagePath),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number.jpName,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  number.enName,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.play_arrow, color: Colors.white),
            onPressed: () {
              try {
                final player = AudioPlayer();

                player.play(AssetSource("sounds/numbers/${number.sound}"));
              } catch (error) {
                print(error);
              }
            },
          ),
        ],
      ),
    );
  }
}
