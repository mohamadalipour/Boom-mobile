class BaseHttpResponse {
  final int statusCode;
  final String body;
  final Map<String, List<String>> header;

  BaseHttpResponse({
    this.statusCode,
    this.body,
    this.header,
  });
}
