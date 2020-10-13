class UnAuthorizedException implements Exception {
  final String message;

  UnAuthorizedException({this.message});
}