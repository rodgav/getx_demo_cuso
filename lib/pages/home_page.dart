import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/global_controller.dart';
import 'package:getx_demo/controllers/home_controller.dart';
import 'package:getx_demo/pages/home_page_widgets/home_label.dart';
import 'package:getx_demo/pages/home_page_widgets/home_list.dart';
import 'package:getx_demo/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              GetBuilder<GlobalController>(
                  id: 'favorites',
                  builder: (_) => TextButton(
                      onPressed: () {},
                      child: Text(
                        'Favoritos (${_.favorites.length})',
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
          // body: HomeList(),
          body: ProductList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _.increment(),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
