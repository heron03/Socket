import 'dart:io';

import 'dart:typed_data';

import 'socket_client.dart';

void ex2() async {
  print('Exercício 2');
  final socket = await Socket.connect('localhost', 4567);
  print('Conectado: ${socket.remoteAddress.address}:${socket.remotePort}');

  socket.listen(
    (Uint8List data) {
      final serverResponse = String.fromCharCodes(data);
      print('Servidor: $serverResponse');
    },
    onError: (error) {
      print(error);
      socket.destroy();
    },
    onDone: () {
      socket.destroy();
    },
  );
  while (true) {
    await sendMessage(socket, 'Opa');
  }
}
