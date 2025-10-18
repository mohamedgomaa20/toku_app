import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
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
                  itemBuilder: (context, index) =>
                      BuildNumberItem(number: numbers[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildNumberItem extends StatefulWidget {
  const BuildNumberItem({super.key, required this.number});

  final Number number;

  @override
  State<BuildNumberItem> createState() => _BuildNumberItemState();
}

class _BuildNumberItemState extends State<BuildNumberItem> {
  bool isPlaying = false;
  AudioPlayer? audioPlayer;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    audioPlayer?.stop();
    audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [Color(0xfff09137), Color(0xfff5a855)],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xfff09137).withOpacity(0.3),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),

      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.1),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: -30,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.08),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Color(0xfffff4db),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Image.asset(
                    widget.number.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.number.jpName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.number.enName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () async {
                    if (isPlaying) {
                      await audioPlayer?.stop();
                      setState(() {
                        isPlaying = false;
                      });
                      return;
                    }
                    audioPlayer ??= AudioPlayer();
                    setState(() {
                      isPlaying = true;
                    });
                    try {
                      await audioPlayer!.play(
                        AssetSource("sounds/numbers/${widget.number.sound}"),
                      );
                      audioPlayer!.onPlayerComplete.listen((event) {
                        setState(() {
                          isPlaying = false;
                        });
                      });
                    } catch (error) {
                      print(error);
                      setState(() => isPlaying = false);
                    }
                  },

                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(isPlaying ? 0.4 : 0.3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(.3),
                          blurRadius: isPlaying ? 15 : 8,
                          spreadRadius: isPlaying ? 2 : 0,
                        ),
                      ],
                    ),

                    child: Icon(
                      isPlaying ? Icons.stop : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
