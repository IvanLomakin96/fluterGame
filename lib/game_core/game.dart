import 'dart:ffi';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter_game_tutorial/game_core/main_loop.dart';
import 'package:flutter_game_tutorial/utilits/global_vars.dart';

class Game extends StatefulWidget
{
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game>
{
 
  ReceivePort _receivePort; // Порт по которому мы принимаем данные из loop.
  Isolate _isolateLoop; // Объявляем изолят.

  // Создаем функцию, которая будет запускать изолят.
  void _startIsolateLoop() async
  {
    _receivePort = ReceivePort(); 
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen
     (
      (
         message
      ) 
        { 
          GlobalVars.currentScene.update();
          setState(() { });
        }
      );
  }

  @override
  // ignore: missing_return
  Void initState()
  {
    _startIsolateLoop();
    super.initState();
  }

  @override
  void dispose()
  {
    _receivePort.close();
    _isolateLoop.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    return GlobalVars.currentScene.buildScene();
  }
}