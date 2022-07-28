import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login.state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  @observable
  var form = FormGroup({
    'cpf': FormControl<String>(),
    'password': FormControl<String>(),
  });

  @computed
  get value => form.value;
}
