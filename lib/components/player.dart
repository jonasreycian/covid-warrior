import 'package:covid_warrior/helper/constant.dart';
import 'package:covid_warrior/game_controller.dart';
import 'package:flutter/material.dart';

class Player {
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  bool isDead = false;

  //ui.Image _playerImage;
  Rect playerRect;

  Player(this.gameController) {
    maxHealth = currentHealth = 300;
    final size = gameController.tileSize * 1.5;
    playerRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - size / 2,
      gameController.screenSize.height / 2 - size / 2,
      size,
      size,
    );

    // initialize(Constant.PLAYER_WARRIOR);
  }

  // void initialize(String imageAsset) async {
  //   _playerImage = await loadImage(imageAsset);
  // }

  void render(Canvas c) {
    Paint color = Paint()..color = Constant.PLAYER_BACKGROUD_COLOR;
    c.drawRect(playerRect, color);

    // c.drawImage(
    //   _playerImage,
    //   new Offset(
    //     (gameController.screenSize.width / 4),
    //     (gameController.screenSize.height / 4),
    //   ),
    //   new Paint(),
    // );
  }

  void update(double t) {
    if(isDead == false && currentHealth <= 0){
      isDead = true;
      
      gameController.initialize();
    }
  }

  void resize(Size size) {}

  // Future<ui.Image> loadImage(String imageAssetPath) async {
  //   ByteData data = await rootBundle.load(imageAssetPath);
  //   image.Image baseSizeImage = image.decodeImage(data.buffer.asUint8List());
  //   image.Image resizeImage = image.copyResize(
  //     baseSizeImage,
  //     height: (baseSizeImage.height * 0.2).round(),
  //     width: (baseSizeImage.width * 0.2).round(),
  //   );
  //   ui.Codec codec = await ui.instantiateImageCodec(
  //     image.encodePng(resizeImage),
  //   );
  //   ui.FrameInfo frameInfo = await codec.getNextFrame();

  //   return frameInfo.image;
  // }
}
