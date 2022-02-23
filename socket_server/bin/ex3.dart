library threading.example.example_interleaved_execution;

import 'dart:async';

import 'package:threading/threading.dart';

Future ex3() async {
  print('Exercício 3');
  var threads = <Thread>[];
  var numOfThreads = 3;
  var count = 3;
  for (var i = 0; i < numOfThreads; i++) {
    var name = String.fromCharCode(65 + i);
    var thread = Thread(() async {
      for (var j = 0; j < count; j++) {
        await Future.value();
        print('$name: $j');
      }
    });

    threads.add(thread);
    await thread.start();
  }

  for (var i = 0; i < numOfThreads; i++) {
    await threads[i].join();
  }
}
