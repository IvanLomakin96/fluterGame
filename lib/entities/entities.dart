// Создаем абстрактный класс, который будет описывать поведение сущностей в игре.
import 'package:flutter/cupertino.dart';

abstract class Entity
{
  double x;
  double y;
  String spritename;
  bool visible = true;
  List sprites = [];
  int currentSprite = 0;
  int currentTick = 0;

  Entity (this.spritename) // Прописываем анимацию для корабля.
  {
    for (var i = 0; i < 4; i++) 
    {
      sprites.add(Image.asset("assets/$spritename$i.png"));
    }
  }

  void _animate()
  {
    currentTick++;

    if (currentTick > 15) 
    {
      currentSprite++;
      currentTick = 0;
    }

    if (currentSprite > 3) 
    {
      currentSprite = 0;
    }
  } 

  void update()
  {
    _animate();
    move();
  } // Прописываем обновления для сущностей.

  void move(); // Прописываем движения для сущностей.

  Widget build(); 

}
