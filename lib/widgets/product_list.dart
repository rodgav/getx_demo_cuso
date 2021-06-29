import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/global_controller.dart';
import 'package:getx_demo/models/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
      id:'products',
      builder: (_) {
        return ListView.builder(
          itemBuilder: (__, index) {
            final ProductModel productModel = _.products[index];
            return ListTile(
              title: Text(productModel.name!),
              subtitle: Text('USD ${productModel.price}'),
              trailing: IconButton(
                  onPressed: () {
                    _.onFavorite(index, !productModel.isFavorite);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: productModel.isFavorite ? Colors.blue : Colors.grey,
                  )),
            );
          },
          itemCount: _.products.length,
        );
      },
    );
  }
}
