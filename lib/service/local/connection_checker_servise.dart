import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCheckerServise {
  final Connectivity connectivity = Connectivity();
  bool isConnected = false;

  Future<bool> findConnectivity()async {
    ConnectivityResult connectivityResult =
        await(Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
