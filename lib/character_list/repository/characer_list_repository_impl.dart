import 'package:boom/base_classes/base_repository.dart';
import 'package:boom/character_list/model/character.dart';
import 'package:boom/character_list/repository/movie_list_repository.dart';
import 'package:boom/data_source/remote_data_source/remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class CharacterListRepositoryImpl  extends BaseRepository implements CharacterListRepository{
  final RemoteDataSource remoteDataSource;

  CharacterListRepositoryImpl({@required this.remoteDataSource});
  @override
  Future<Either<Exception, List<Character>>> getCharacterList() async{
   var result=await remoteDataSource.getCharacterList();
   return result.fold((_l) => Left(_l), (_r) =>parseListRightValue(Character(), _r));
  }

}