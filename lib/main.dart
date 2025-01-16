import 'package:flutter/material.dart';
import 'package:flutter_data_caching_example/common/helpers/internet_connection/connection_helper.dart';
import 'package:flutter_data_caching_example/presentation/home/page/home_page.dart';
import 'package:flutter_data_caching_example/presentation/home/provider/product_provider.dart';
import 'package:flutter_data_caching_example/servie_locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(ChangeNotifierProvider(
    create: (_) =>ProductProvider(ConnectivityService()) ,
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'data caching',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
