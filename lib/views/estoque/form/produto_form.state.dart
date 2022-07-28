import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'produto_form.state.g.dart';

class ProdutoFormState = _ProdutoFormState with _$ProdutoFormState;

abstract class _ProdutoFormState with Store {
  @observable
  var form = FormGroup({
    'description': FormControl<String>(),
    'label': FormControl<String>(),
    'barcode': FormControl<String>(),
  });

  @computed
  get value => form.value;
}
