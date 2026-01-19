import 'package:connectivity_plus/connectivity_plus.dart';

import 'i_network_status.dart';

class NetworkStatusImpl implements INetworkStatus {
  final Connectivity _connectivity;

  NetworkStatusImpl(this._connectivity);

  @override
  Future<bool> hasAnyNetwork() async {
    final result = await _connectivity.checkConnectivity();

    return !result.contains(ConnectivityResult.none);
  }
}
