import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uanity/views/estoque/form/produto_form.state.dart';
import 'package:uanity/views/estoque/form/widgets/barcode_input.widget.dart';
import 'package:uanity/views/estoque/form/widgets/product_label_input.widget.dart';
import 'package:uanity/views/estoque/form/widgets/product_name_input.widget.dart';

class ProdutoFormWidget extends StatefulWidget {
  const ProdutoFormWidget({Key? key}) : super(key: key);

  @override
  State<ProdutoFormWidget> createState() => _ProdutoFormWidgetState();
}

class _ProdutoFormWidgetState extends State<ProdutoFormWidget> {
  @override
  Widget build(BuildContext context) {
    var produtoFormState = ProdutoFormState();
    var formGroup = produtoFormState.form;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Produto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ReactiveForm(
          formGroup: formGroup,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ProductNameInputWidget(),
              SizedBox(height: 10),
              ProductLabelInput(),
              SizedBox(height: 10.0),
              BarcodeInputWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
