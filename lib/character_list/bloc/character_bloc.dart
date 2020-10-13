import 'package:boom/base_classes/bloc/common_properitoes.dart';
import 'package:boom/character_list/model/character.dart';

abstract class CharacterListBloc extends CommonProperties{
  List<Character> characters;

  void getCharacters();
}