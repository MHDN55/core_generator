import 'dart:convert';

Map<String, dynamic> decodeJWT(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid JWT token format');
  }

  final payload = parts[1];
  final normalized = base64.normalize(payload);
  final payloadMap = json.decode(utf8.decode(base64Url.decode(normalized)));

  return payloadMap;
}
