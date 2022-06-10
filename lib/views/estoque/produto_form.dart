import 'package:flutter/material.dart';
import 'package:uanity/shared/arp_input.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ProdutoForm extends StatefulWidget {
  const ProdutoForm({Key? key}) : super(key: key);

  @override
  State<ProdutoForm> createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<ProdutoForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nomeProdutoController = TextEditingController();
    TextEditingController descricaoProdutoController = TextEditingController();
    TextEditingController codigoBarrasController = TextEditingController();

    _scan() async {
      String barcodeScan = await FlutterBarcodeScanner.scanBarcode(
          "#e28743", "Cancelar", false, ScanMode.BARCODE);

      setState(() {
        codigoBarrasController.text = barcodeScan;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Produto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ArpInput(
              label: 'Nome do Produto',
              controller: nomeProdutoController,
            ),
            const SizedBox(height: 10),
            ArpInput(
              label: 'Descriçao do Produto',
              controller: descricaoProdutoController,
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: ArpInput(
                    label: 'Codigo de Barras',
                    controller: codigoBarrasController,
                    enabled: false,
                  ),
                ),
                IconButton(onPressed: _scan, icon: const Icon(Icons.camera_alt))
              ],
            )
          ],
        ),
      ),
    );
  }
}
