import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uanity/shared/arp_reactive_input.dart';

class BarcodeInputWidget extends StatelessWidget {
  const BarcodeInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formGroup = ReactiveForm.of(context) as FormGroup;

    _scan() async {
      String barcodeScan = await FlutterBarcodeScanner.scanBarcode(
        "#e28743",
        "Cancelar",
        false,
        ScanMode.BARCODE,
      );

      formGroup.control('barcode').value = barcodeScan;
    }

    return ArpReactiveInput(
      label: 'Código de Barras',
      controlName: 'barcode',
      readOnly: true,
      suffix: IconButton(
        onPressed: _scan,
        icon: const Icon(Icons.photo_camera),
      ),
    );
  }
}
