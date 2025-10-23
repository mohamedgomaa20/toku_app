import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/item_model.dart';

class BuildPhrasesItem extends StatefulWidget {
  const BuildPhrasesItem({
    super.key,
    required this.item,
    required this.colorOne,
    required this.colorTwo,
    required this.itemType,
    required this.delay,
  });

  final Item item;
  final Color colorOne;
  final Color colorTwo;
  final String itemType;
  final int delay;

  @override
  State<BuildPhrasesItem> createState() => _BuildPhrasesItemState();
}

class _BuildPhrasesItemState extends State<BuildPhrasesItem>
    with TickerProviderStateMixin {
  bool _isPlaying = false;
  AudioPlayer? _audioPlayer;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _slideAnimation;
  late final Animation<double> _opacityAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _scaleAnimation = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _animationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer?.stop();
    _audioPlayer?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_slideAnimation.value, 0),
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(opacity: _opacityAnimation.value, child: child),
          ),
        );
      },

      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [widget.colorOne, widget.colorTwo],
          ),
          boxShadow: [
            BoxShadow(
              color: widget.colorOne.withOpacity(0.3),
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
                SizedBox(width: 16),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.format_quote,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.item.jpName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                          widget.item.enName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                    onTap: () async {
                      HapticFeedback.lightImpact();

                      if (_isPlaying) {
                        await _audioPlayer?.stop();
                        setState(() {
                          _isPlaying = false;
                        });
                        return;
                      }
                      await _audioPlayer?.stop();

                      setState(() {
                        _isPlaying = true;
                      });
                      try {
                        await _audioPlayer!.play(
                          AssetSource(
                            "sounds/${widget.itemType}/${widget.item.sound}",
                          ),
                        );
                        _audioPlayer!.onPlayerComplete.listen((event) {
                          setState(() {
                            _isPlaying = false;
                          });
                        });
                      } catch (error) {
                        print(error);
                        setState(() => _isPlaying = false);
                      }
                    },

                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(_isPlaying ? 0.4 : 0.3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(.3),
                            blurRadius: _isPlaying ? 15 : 8,
                            spreadRadius: _isPlaying ? 2 : 0,
                          ),
                        ],
                      ),

                      child: AnimatedScale(
                        scale: _isPlaying ? 1.1 : 1.0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeOutBack,
                        child: Icon(
                          _isPlaying ? Icons.stop : Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
