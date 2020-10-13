
import 'package:boom/model/screen_state.dart';

abstract class CommonProperties {

  Stream<BaseScreenState> get getBlocScreenState;

  Stream<String> get errorMessage;
   void dispose();
}
