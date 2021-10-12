// Настраиваем количество кадров для приложухи.
import 'dart:isolate';

bool running = true;

// Прописывем основные переменные и запуск таймера.
void mainLoop(SendPort sendPort) async
{
  final double fps = 50;
  final double second = 1000;
  final double updateTime = second / fps;
  double updates = 0;
  DateTime today = DateTime.now();

  Stopwatch loopWatch = Stopwatch();
  loopWatch.start();
  Stopwatch timerWatch = Stopwatch();
  timerWatch.start();

  while(running)
  {
    if(loopWatch.elapsedMilliseconds >= updateTime)
    {
      updates++;
      loopWatch.reset();
      sendPort.send(true);
    }

    if(timerWatch.elapsedMilliseconds>second)
    {
      print(today.toString() + " FPS: " + updates.toString());
      updates = 0;
      timerWatch.reset();
    }
  }
}

 // Прописываем остановку таймера.
void stopLoop()
{
  running = false;
}
