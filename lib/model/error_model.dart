class ErrorModel {
  int code;
  int statusCode;
  String description;

  ErrorModel({this.code, this.description,this.statusCode});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    if(json['error']!=null) {
      code = (json['error']['code']) ?? null;
      statusCode = (json['error']['statusCode']) ?? null;
      description = json['error']['description'] ?? null;
    }
    else {
      description = json['description'] ?? json['message'] ?? null;
    }
  }
}
