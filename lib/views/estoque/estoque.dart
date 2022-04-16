import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class EstoqueView extends StatefulWidget {
  const EstoqueView({Key? key}) : super(key: key);

  @override
  State<EstoqueView> createState() => _EstoqueViewState();
}

class _EstoqueViewState extends State<EstoqueView> {
  String barcode = 'Barcode here';
  @override
  Widget build(BuildContext context) {
    _scan() async {
      String barcodeScan = await FlutterBarcodeScanner.scanBarcode(
          "#e28743", "Cancelar", false, ScanMode.BARCODE);

      setState(() {
        barcode = barcodeScan;
        // barcode = 'Changed';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _scan,
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
            )
          ],
        ),
      ),
    );
  }
}
