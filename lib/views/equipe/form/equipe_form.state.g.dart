// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipe_form.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EquipeFormState on _EquipeFormState, Store {
  Computed<dynamic>? _$valueComputed;

  @override
  dynamic get value => (_$valueComputed ??=
          Computed<dynamic>(() => super.value, name: '_EquipeFormState.value'))
      .value;

  late final _$formAtom = Atom(name: '_EquipeFormState.form', context: context);

  @override
  FormGroup get form {
    _$formAtom.reportRead();
    return super.form;
  }

  @override
  set form(FormGroup value) {
    _$formAtom.reportWrite(value, super.form, () {
      super.form = value;
    });
  }

  @override
  String toString() {
    return '''
form: ${form},
value: ${value}
    ''';
  }
}
