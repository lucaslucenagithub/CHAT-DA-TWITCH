import 'package:http/http.dart' as http;
import './twitchBaseService.dart';

final String authBaseUrl = "https://id.twitch.tv/oauth2/";
final String claimScopes = "user:read:email"; //separe by spaces encoded url

String getUserAuthenticationAddress() {
  var redirectUri = "http://localhost";
  String urlPath = "$authBaseUrl/authorize?client_id= " +
      "$clientId/&redirect_uri=redirect_uri=$redirectUri" +
      "&response_type=code&scope=$claimScopes";
  return urlPath;
}
