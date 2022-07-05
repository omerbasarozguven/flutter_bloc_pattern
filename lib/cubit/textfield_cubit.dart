import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'textfield_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  TextFieldCubit() : super(TextFieldState(str: 'blank'));

  void takeinput(String? user_input) {
    if (user_input != null) {
      emit(TextFieldState(str: user_input));
    } else {
      emit(TextFieldState(str: 'blank'));
    }
  }
}
