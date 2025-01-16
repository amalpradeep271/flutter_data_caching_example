import 'package:flutter/material.dart';
import 'package:flutter_data_caching_example/presentation/home/provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Fetch movies when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('CACHING DATA EXAMPLE'),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (productProvider.products.isEmpty) {
            return const Center(child: Text('No Products available'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (productProvider.message.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    productProvider.message,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: productProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    return ListTile(
                      leading: SizedBox(
                          width: 100,
                          child: productProvider.hasInternet
                              ? Image.network(product.photoUrl.toString())
                              : const Icon(Icons.new_releases_outlined)),
                      title: Text(product.name ?? 'No title'),
                      subtitle: Text(
                        product.description ?? "No description",
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
