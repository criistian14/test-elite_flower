import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  /// Get the value if connected to the internet
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    ConnectivityResult result = await connectionChecker.checkConnectivity();
    if (result == ConnectivityResult.none) return false;

    return true;
  }
}
