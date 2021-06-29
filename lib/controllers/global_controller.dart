import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/product.dart';

class GlobalController extends GetxController {
  List<ProductModel> _products = [];
  Map<String, ProductModel> _favorites = Map();

  Map<String, ProductModel> get favorites => _favorites;

  List<ProductModel> get products => _products;

  @override
  void onInit() {
    _loadProducts();
    super.onInit();
  }

  Future<void> _loadProducts() async {
    final String productsString =
        await rootBundle.loadString('assets/jsons/products.json');
    this._products = productModelFromJson(productsString);
    update(['products']);
  }

  onFavorite(int index, bool isFavorite) {
    ProductModel productModel = this.products[index];
    productModel.isFavorite = isFavorite;
    if (isFavorite) {
      this._favorites[productModel.name!] = productModel;
    } else {
      this._favorites.remove(productModel.name);
    }
    update(['products', 'favorites']);
  }
}
