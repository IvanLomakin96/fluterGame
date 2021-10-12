
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_tutorial/game_core/game.dart';
import 'package:flutter_game_tutorial/utilits/global_vars.dart';

//Задаём первоначальные настройки и запускаем саму игру.
void main() 
{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations
  (
    [
      DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight
    ]
  ).whenComplete // Прописаваем горизонтальное положение при старте игры, в которое вставляем наш
  (()
    {     
      SystemChrome.setEnabledSystemUIMode
      (
        SystemUiMode.manual, overlays: [
          SystemUiOverlay.bottom
        ]
      );

      runApp
      (
        MaterialApp
        (
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold
            (
              body: MyApp(),
            ),
          )
        )
      );
    }
  );
 
}

class MyApp extends StatefulWidget
{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies()
  {
    initGame(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      decoration: BoxDecoration
      (
        image: DecorationImage
        (
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover
        )
      ),
      child: Game()
    );
  }

  void initGame(context) // Певоначальная инициализация игры.
  {
    GlobalVars.screenWidth = MediaQuery.of(context).size.width;
    GlobalVars.screenHeight = MediaQuery.of(context).size.height;
  }
}
