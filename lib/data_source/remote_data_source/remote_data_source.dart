import 'package:boom/model/base_http_response.dart';
import 'package:dartz/dartz.dart';


abstract class RemoteDataSource {
  Future<Either<Exception, BaseHttpResponse>> getCharacterList();
}
