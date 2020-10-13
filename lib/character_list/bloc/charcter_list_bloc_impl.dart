import 'package:boom/base_classes/bloc/base_bloc.dart';
import 'package:boom/character_list/model/character.dart';
import 'package:boom/character_list/repository/movie_list_repository.dart';

import 'package:boom/model/screen_state.dart';

import 'character_bloc.dart';

class CharacterListBlocImpl extends BaseBLoC implements CharacterListBloc {
  final CharacterListRepository characterListRepository;

  CharacterListBlocImpl({this.characterListRepository});

  @override
  List<Character> characters;

  @override
  void dispose() {}

  @override
  Stream<String> get errorMessage => getBaseError;

  @override
  Stream<BaseScreenState> get getBlocScreenState => getScreenState;

  @override
  void getCharacters() async {
    try {
      addNewStateToScreenAndIgnoreRepetitiveState(BaseScreenState.loading);
      var result = await characterListRepository.getCharacterList();
      result.fold(
          (_l) => mapExceptionToEnum(_l), (_r) => _handleRightValue(_r));
    } catch (error) {
      addNewStateToScreenAndIgnoreRepetitiveState(
          BaseScreenState.failedToParseJson);
    }
  }

  _handleRightValue(List<Character> r) {
    characters=List<Character>();
    r.forEach((element) {characters.add(element);});

    addNewStateToScreenAndIgnoreRepetitiveState(BaseScreenState.idle);
  }
}
