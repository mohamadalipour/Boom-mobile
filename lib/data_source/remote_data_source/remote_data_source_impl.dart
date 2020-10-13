import 'dart:async';

import 'package:boom/data_source/api_client/api_client.dart';
import 'package:boom/model/base_http_response.dart';
import 'package:boom/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient apiClient;

  RemoteDataSourceImpl(
      {@required this.apiClient});

  @override
  Future<Either<Exception, BaseHttpResponse>> getCharacterList() async{


    return await apiClient.getApi(
      url: '/v1/characters',
        headers: Utils.getDefaultHeader,
    queryParams: {'key':'\$2a\$10\$AXzBR9uXoX/rfRjhkXGnf.3ZSKwuefWDC4By4Z9315xcs9DhOHHse','house':'Gryffindor','bloodStatus':'pure-blood'},
    );


  }


}
