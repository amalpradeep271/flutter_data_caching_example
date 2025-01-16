import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityService {
  final InternetConnectionChecker _checker = InternetConnectionChecker();

  Future<bool> isConnected() async {
    return await _checker.hasConnection;
  }
}
