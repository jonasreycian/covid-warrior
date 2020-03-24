import 'dart:ui';

import 'package:covid_warrior/components/enemy.dart';
import 'package:covid_warrior/components/player.dart';
import 'package:covid_warrior/helper/constant.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';

class GameController extends Game {
  Size screenSize;
  double tileSize;
  Player player;
  Enemy enemy;

  GameController() {
    initialize();
  }

  void initialize() async{
    resize(await Flame.util.initialDimensions());

    // Initialize the Player
    player = Player(this);
    enemy = Enemy(this, 200, 200);
  }

  // Render gr
  @override
  void render(Canvas c) {
    // Draw the backgound
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgoundPaint = Paint()..color = Constant.BACKGROUND_COLOR;
    c.drawRect(background, backgoundPaint);

    // Draw the player
    player.render(c);
    enemy.render(c);
  }

  // Update the screen
  @override
  void update(double t) {
    enemy.update(t);
  }

  // Set the initial size of the screen
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  void onTapDown(TapDownDetails d){
    print('Tap ${d.globalPosition}');
    enemy.health--;
  }
}
