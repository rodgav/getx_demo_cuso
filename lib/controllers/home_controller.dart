import 'package:get/get.dart';
import 'package:getx_demo/api/users_api.dart';
import 'package:getx_demo/models/user.dart';
import 'package:getx_demo/pages/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<Datum> _datum = [];
  bool _loading = true;

  int get counter => _counter;

  List<Datum> get datum => _datum;

  bool get loading => _loading;

  @override
  void onReady() {
    this.loadUsers();
    super.onReady();
  }

  Future<void> loadUsers() async {
    final data = await UsersApi.instance.getUsers(1);
    _datum = data!.data!;
    _loading = false;
    update(['users']);
  }

  void increment() {
    this._counter++;
    update(['text'], _counter >= 10);
  }

  Future<void> showUserProfile(Datum datum) async {
    final result = Get.to<String>(ProfilePage(), arguments: datum);
    if(result!=null){

    }
  }
}
