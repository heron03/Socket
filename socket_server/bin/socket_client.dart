import 'dart:io';
import 'dart:typed_data';
import 'socket_server.dart';
import 'ex1.dart';
import 'ex2.dart';
import 'ex3.dart';

void main() async {
  servidor();
  await ex1();
  print('\n');
  await ex3();
  print('\n');
  ex2();
}

Future<void> sendMessage(Socket socket, String message) async {
  print('Client: $message');
  socket.write(message);
  await Future.delayed(Duration(seconds: 2));
}
