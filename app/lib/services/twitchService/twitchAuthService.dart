import 'package:http/http.dart' as http;
import './twitchConfigs.dart' as config;
import 'dart:io';
import 'dart:convert';
import '../../models/token.dart';

class TwitchAuthService {
  String getUserAuthenticationAddress() {
    String urlPath = "${config.authBaseUrl}/authorize?client_id=" +
        "${config.clientId}&redirect_uri=${config.redirectUrl}" +
        "&response_type=code&scope=${config.claimScopes}";
    return urlPath;
  }

  Future<dynamic> getAccessToken(String authCode) async {
    var queryParameters = {
      'client_id': config.clientId,
      'client_secret': config.clientSecret,
      'code': authCode,
      'grant_type': 'authorization_code',
      'redirect_uri': config.redirectUrl,
    };

    var uri = Uri.https('id.twitch.tv', '/oauth2/token', queryParameters);
    print('post uri $uri');

    var response = await http.post(uri);

    Map<String, dynamic> respMap = json.decode(response.body);
    if (response.statusCode == HttpStatus.ok) {
      // NOTE we'd typically deserialize JSON properly here
      final token = Token(respMap['access_token'], respMap['refresh_token']);
      return Future.value(token);
    } else {
      print("error is ${respMap['error']}");
      return Future.value(null);
    }
  }
}
