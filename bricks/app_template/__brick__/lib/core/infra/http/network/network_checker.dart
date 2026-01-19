import 'dart:async';

import '../../../config/constants/api/external_uris.dart';
import '../i_http.dart';
import 'i_network_status.dart';

class NetworkChecker {
  static const _timeout = Duration(seconds: 3);

  final INetworkStatus _networkStatus;
  final IHttp _http;

  NetworkChecker(this._networkStatus, this._http);

  /// Check rápido (barato)
  Future<bool> hasAnyNetwork() => _networkStatus.hasAnyNetwork();

  /// Check real (caro): só use na opção B quando der erro de rede/timeout
  Future<bool> hasInternetAccess() async {
    try {
      final response = await _http.get(ExternalUris.google).timeout(_timeout);

      return response.statusCode == 204;
    } catch (_) {
      return false;
    }
  }
}
