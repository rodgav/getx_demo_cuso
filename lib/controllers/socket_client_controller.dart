import 'dart:async';
import 'package:faker/faker.dart';
import 'package:get/get.dart';

class SocketClientController extends GetxController {
  RxString _message = ''.obs;
  RxString _searchText = ''.obs;

  RxString get message => _message;

  Timer? _timer;
  final _faker = Faker();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() {
    /* ever(_counter, (_){
      print('counter $_counter');
    });*/

    /*once(_counter, (_){
      print('counter $_counter');
    });*/

    /*debounce(_searchText, (_) {
      print('${_searchText.value}');
    }, time: Duration(milliseconds: 500),onError: (e){
      print('error $e');
    });*/

    interval(_searchText, (_) {
      print('${_searchText.value}');
    }, time: Duration(milliseconds: 500),onError: (e){
      print('error $e');
    });

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _message.value = _faker.lorem.sentence();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void setSearchText(String text){
    _searchText.value = text;
  }
}
