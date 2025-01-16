import 'package:flutter/foundation.dart';
import 'package:flutter_data_caching_example/common/helpers/internet_connection/connection_helper.dart';
import 'package:flutter_data_caching_example/domain/entities/product_entity.dart';
import 'package:flutter_data_caching_example/domain/usecase/get_hive_pproducts_usecase.dart';
import 'package:flutter_data_caching_example/domain/usecase/get_products_usecase.dart';
import 'package:flutter_data_caching_example/servie_locator.dart';

class ProductProvider with ChangeNotifier {
  List<ProductEntity> _products = [];
  bool _isLoading = false;
  String _message = "";
  bool _hasInternet = false;

  List<ProductEntity> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasInternet => _hasInternet;

  String get message => _message;
  final ConnectivityService _connectivityService;

  ProductProvider(this._connectivityService);

  Future<void> fetchProducts() async {
    _isLoading = true;
    _message = "";
    notifyListeners();
    _hasInternet = await _connectivityService.isConnected();
    if (_hasInternet) {
      var result = await sl<GetProductsUsecase>().call();
      result.fold(
        (error) {
          _products = [];
          _message = 'Failed to load data from the server';
        },
        (data) {
          _products = data;
        },
      );
    } else {
      _products = await sl<GetHiveProductsUsecase>().call();
      _message = 'No internet connection, data is shown from local';
    }
    _isLoading = false;
    notifyListeners();
  }
}
