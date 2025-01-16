import 'package:flutter_data_caching_example/core/network/dio_client.dart';
import 'package:flutter_data_caching_example/data/repository/product_repository_impl.dart';
import 'package:flutter_data_caching_example/data/sources/product_api_services.dart';
import 'package:flutter_data_caching_example/domain/entities/product_entity.dart';
import 'package:flutter_data_caching_example/domain/repository/product_repository.dart';
import 'package:flutter_data_caching_example/domain/usecase/get_hive_pproducts_usecase.dart';
import 'package:flutter_data_caching_example/domain/usecase/get_products_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  await Hive.openBox<ProductEntity>('productBox');
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<ProductApiServices>(ProductApiServicesImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  sl.registerSingleton<GetProductsUsecase>(GetProductsUsecase());
  sl.registerSingleton<GetHiveProductsUsecase>(GetHiveProductsUsecase());
}
