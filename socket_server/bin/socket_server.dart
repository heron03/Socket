import 'dart:io';
import 'dart:typed_data';

void servidor() async {
  final server = await ServerSocket.bind(InternetAddress.anyIPv4, 4567);

  server.listen((client) {
    handleConnection(client);
  });
}

void handleConnection(Socket client) {
  print('Connection from'
      ' ${client.remoteAddress.address}:${client.remotePort}');

  client.listen(
    (Uint8List data) async {
      await Future.delayed(Duration(seconds: 1));
      final message = String.fromCharCodes(data);
      client.write('$message ');

      await client.close();
    },
    onError: (error) {
      print(error);
      client.close();
    },
    onDone: () {
      client.close();
    },
  );
}
