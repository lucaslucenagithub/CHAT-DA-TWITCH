class Token {
  String accessToken;
  String refreshToken;
  int expiresIn;
  List<String> scopes;
  String tokenType;

  Token(this.accessToken, this.refreshToken);
}
