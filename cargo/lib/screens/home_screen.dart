import 'package:cargo/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products', style: TextStyle(fontSize: 17)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 238, 238),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Color.fromARGB(255, 168, 166, 166),
                        fontSize: 17,
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Consumer<Myprovider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (provider.products.isEmpty) {
                return const Expanded(
                  child: Center(child: Text('No products found')),
                );
              }

              return Expanded(
                child: GridView.builder(
                  itemCount: provider.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  //  mainAxisSpacing: 5,
                  //  crossAxisSpacing: 5
                  ),
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Color.fromARGB(255, 243, 238, 238),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Image.network(
                              product.image,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 36),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                product.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '₹ ${product.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
