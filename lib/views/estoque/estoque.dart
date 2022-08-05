import 'package:flutter/material.dart';
import 'package:uanity/routes/produto_routes.dart';

class EstoqueView extends StatefulWidget {
  const EstoqueView({Key? key}) : super(key: key);

  @override
  State<EstoqueView> createState() => _EstoqueViewState();
}

class _EstoqueViewState extends State<EstoqueView> {
  String barcode = 'Barcode here';
  @override
  Widget build(BuildContext context) {
    _openForm() {
      Navigator.of(context).pushNamed(ProdutoRoutes.cadastroRoute);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _openForm,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(
                barcode,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
