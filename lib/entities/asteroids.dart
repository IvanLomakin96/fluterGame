import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_game_tutorial/entities/entities.dart';
import 'package:flutter_game_tutorial/utilits/global_vars.dart';

class Asteroid extends Entity
{
  
  Asteroid() : super('asteroidbig') 
  {
    x = 0;
    y = 0;
  }
  
  

  double _angle = 10;
  double _degree = 20;
  bool isMoveLeft = false;
  bool isMoveRight = false;
  double _speed = 6;
  

  @override
  Widget build() 
  {
    return Positioned(top: y, left: x, child: Transform.rotate(angle: _angle, child: sprites[currentSprite],),);
  }


  @override
  void move() 
  {
    _angle = (_degree * 3.14) / 180;
    
    x += sin(_degree * 0.0175) * _speed;
    y -= cos(_degree * 0.0175) * _speed;

    if(x > GlobalVars.screenWidth || y > GlobalVars.screenHeight || x < 0 || y < 0)
    {
      visible = false;
    }

    isMoveLeft = true;
    isMoveRight = true;
  }
  
}
