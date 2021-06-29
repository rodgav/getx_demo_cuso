import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/socket_client_controller.dart';
import 'package:getx_demo/models/pet.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = '0'.obs;
  RxList<String> items = <String>[].obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;
  Pet myPet = Pet(name: 'Lulu', age: 1);
  StreamSubscription<String>? _subscription;

  @override
  void onInit() {
    final socketController = Get.find<SocketClientController>();
    _subscription = socketController.message.listen((data) {
    });
    super.onInit();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  void increment() {
    counter.value++;
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void addMapItem() {
    final key = DateTime.now().toString();
    mapItems[key] = key;
  }

  void removeMapItem(String key) {
    mapItems.remove(key);
  }

  void setPetAge(int age) {
    myPet.age = age;
    //myPet.value = myPet.value.copyWhit(age: age);
  }
}
