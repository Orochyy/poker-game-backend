import 'package:simple_poker_game/services/config.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketInstance {
  int userID;
  int roomID;
  late WebSocketChannel socketChannel;

  SocketInstance({this.userID = 0, this.roomID = 0});

  void connect() {
    final serviceConfig = ServiceConfig.getInstance();
    socketChannel = WebSocketChannel.connect(Uri.parse(
        'ws://${serviceConfig.getHost()}:${serviceConfig.getPort()}/ws/$userID?room=$roomID'));
    print(socketChannel);
    print(serviceConfig.getHost());
    print(serviceConfig.getPort());
  }

  void send(String msg) {
    socketChannel.sink.add(msg);
  }

  void listen(Function handler) {
    socketChannel.stream.listen((event) => handler(event));
  }

  void disconnect() {
    socketChannel.sink.close();
  }
}
