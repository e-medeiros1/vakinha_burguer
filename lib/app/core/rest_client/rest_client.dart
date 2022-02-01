import 'package:get/get.dart';

class RestClient extends GetConnect {
  final _backendBaseUlr = 'http://dartweek.academiadoflutter.com.br/';

  RestClient() {
    httpClient.baseUrl = _backendBaseUlr;
  }
}

class RestClienteException implements Exception {
  final int? code;
  final String message;

  RestClienteException(this.message, {this.code});

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
