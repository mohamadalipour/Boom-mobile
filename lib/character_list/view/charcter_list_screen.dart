import 'package:boom/base_widgets/base_screen/base_screen.dart';
import 'package:boom/base_widgets/idle_widget.dart';
import 'package:boom/character_list/bloc/character_bloc.dart';
import 'package:boom/model/screen_state.dart';
import 'package:flutter/material.dart';

class CharacterListScreen extends StatefulWidget {
  final CharacterListBloc bLoC;

  const CharacterListScreen({Key key, @required this.bLoC}) : super(key: key);

  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen>
    implements IdleWidget {

  @override
  void initState() {
    super.initState();
    widget.bLoC.getCharacters();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: StreamBuilder<BaseScreenState>(
          stream: widget.bLoC.getBlocScreenState,
          initialData: BaseScreenState.loading,
          builder: (context, snapshot) {
            return BaseScreen(
              errorDescription: widget.bLoC.errorMessage,
              baseScreenState: snapshot.data,
              onTapRetry: onTapRetry,
              idleWidget: this,
            );
          }),
    );
  }

  @override
  Widget getIdleWidget() {
    debugPrint('idell state called');
    return ListView.builder(
        itemCount: widget.bLoC.characters.length,
        itemBuilder: (context, index) =>
            Text('${widget.bLoC.characters[index].name}'));
  }

  void onTapRetry() {
    widget.bLoC.getCharacters();
  }
}
