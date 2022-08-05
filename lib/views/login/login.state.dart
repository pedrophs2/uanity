import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login.state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  @observable
  var form = FormGroup({
    'cpf': FormControl<String>(validators: [
      Validators.required,
      Validators.maxLength(11),
      Validators.minLength(11),
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(5),
      Validators.maxLength(16),
    ]),
  });

  @computed
  get value => form.value;
}
