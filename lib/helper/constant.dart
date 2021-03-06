import 'package:flutter/material.dart';

class Constant {
  static const Color BACKGROUND_COLOR = Color(0xFFFAFAFA);
  static const Color PLAYER_BACKGROUD_COLOR = Color(0xFF0000FF);

  static const Color ENEMY_BACKGROUD_COLOR_1 = Color(0xFFFF7F7F);
  static const Color ENEMY_BACKGROUD_COLOR_2 = Color(0xFFFF4C4C);
  static const Color ENEMY_BACKGROUD_COLOR_3 = Color(0xFFFF4500);
  static const Color ENEMY_BACKGROUD_COLOR_D = Color(0xFFFF0000);

  static const String ENEMY_BODY = 'assets/enemy_body.png';
  static const String ENEMY_EYE = 'assets/enemy_eye.png';
  static const String PLAYER_HELP = 'assets/player_help.png';
  static const String PLAYER_SAD = 'assets/player_sad.png';
  static const String PLAYER_WARRIOR = 'assets/player_warrior.png';
  static const String PLAYER_WARRIOR_SQ = 'assets/player_warrior_sq.png';
}

enum State { menu, playing }
