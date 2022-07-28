import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'equipe_form.state.g.dart';

class EquipeFormState = _EquipeFormState with _$EquipeFormState;

abstract class _EquipeFormState with Store {
  @observable
  var form = FormGroup({
    'nome': FormControl<String>(),
    'cpf': FormControl<String>(),
    'senha': FormControl<String>(),
    'cargo': FormControl<int>(),
  });

  @computed
  get value => form.value;
}
