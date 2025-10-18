import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/number_model.dart';
import '../widgets/build_item.dart';

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
                    Icon(Icons.palette, color: Color(0xff79329f), size: 28),
                    SizedBox(width: 10),
                    Text(
                      "Colors",
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
                        color: Color(0xff79329f).withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xff79329f).withOpacity(.5),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.list, color: Colors.white, size: 16),
                          SizedBox(width: 5),
                          Text(
                            "${colors.length}",
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
                        color: Color(0xff79329f).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        CupertinoIcons.info,
                        color: Color(0xff79329f),
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
                  itemCount: colors.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => BuildItem(
                    item: colors[index],
                    itemType: "colors",
                    colorOne: Color(0xff79329f),
                    colorTwo: Color(0xff9345bf),
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
