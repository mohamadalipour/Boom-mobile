import 'package:boom/character_list/model/character.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterListRepository{

  Future<Either<Exception,List<Character>>> getCharacterList();
}