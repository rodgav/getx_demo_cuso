import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/user.dart';

class ProfileController extends GetxController {
  Datum? _datum;

  Datum? get datum => _datum;

  String _inputText = '';

  @override
  void onInit() {
    this._datum = Get.arguments as Datum;
    super.onInit();
  }

  void onInputTextChanged(String text) {
    this._inputText = text;
  }

  void goToBacksWhitData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      showCupertinoModalPopup(
          context: Get.overlayContext!,
          builder: (_) => CupertinoActionSheet(
                title: Text('ERROR'),
                message: Text('Ingrese un dato valido'),
                cancelButton: CupertinoActionSheetAction(
                    onPressed: () => Get.back(), child: Text('ACEPTAR')),
              ));
    }
  }
}
