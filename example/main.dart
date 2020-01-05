import 'dart:io';
import 'package:chartisan/chartisan.dart';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    9000,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    final chart = Chartisan.build().labels(['a', 'b', 'c']).dataset(
        'Sample 1', [1, 2, 3]).dataset('Sample 2', [3, 2, 1]).toJSON();
    request.response.write(chart);
    await request.response.close();
  }
}
