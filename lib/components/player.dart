import 'dart:ui' as ui;

import 'package:covid_warrior/helper/constant.dart';
import 'package:covid_warrior/game_controller.dart';
import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent {
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  bool isDead = false;
  double _size;

  //ui.Image _playerImage;
  Rect playerRect;
  Sprite _playerSprite = Sprite(Constant.PLAYER_WARRIOR_SQ);
  Position _p;
  Position _positionSize;

  Player(this.gameController) {
    maxHealth = currentHealth = 300;

    _size = gameController.tileSize * 1.5;

    playerRect = Rect.fromLTWH(
      gameController.screenSize.width * 0.5 - _size * 0.5,
      gameController.screenSize.height * 0.5 - _size * 0.5,
      _size,
      _size,
    );

    _p = Position.fromSize(gameController.screenSize);
    _positionSize = Position.fromSize(gameController.screenSize);
  }

  @override
  void render(Canvas c) {
    //_playerSprite.renderCentered(c, _p, size: _positionSize);
    Paint playerPaint = Paint()..color = Constant.PLAYER_BACKGROUD_COLOR;
    //c.drawRect(playerRect, playerPaint);
    c.drawOval(playerRect, playerPaint);
  }

  @override
  void update(double t) {
    if (isDead == false && currentHealth <= 0) {
      isDead = true;

      gameController.initialize();
    }
  }
}
