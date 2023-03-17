class ServiceConfig {
  late String host;
  late int port;
  static final ServiceConfig _singleton = ServiceConfig();

  static ServiceConfig getInstance() {
    return _singleton;
  }

  void setHost(String host) {
    this.host = host;
    print(host);
  }

  void setPort(int port) {
    this.port = port;
    print(port);
  }

  String getHost() {
    print(host);
    return host;
  }

  int getPort() {
    print(port);
    return port;
  }
}
