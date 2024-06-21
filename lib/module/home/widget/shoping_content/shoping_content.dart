import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class ShopingContent extends StatefulWidget {
  const ShopingContent({super.key});

  @override
  ShopingContentState createState() => ShopingContentState();
}

class ShopingContentState extends State<ShopingContent> {
  final List<Product> products = [
    Product(
      name: 'Jersey 1',
      description: 'This is the description for jersey 1.',
      price: 300000,
      imageUrl:
          'https://down-id.img.susercontent.com/file/id-11134207-7qul8-li2u3o5vuzrtde',
      category: 'Jersey',
      availableSizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      name: 'Jersey Persikota Tangerang 2009 2010(Merchandise)',
      description: 'This is the description for merchandise 1.',
      price: 300000,
      imageUrl: 'https://s4.bukalapak.com/img/96445139692/large/data.jpeg',
      category: 'Merchandise',
      availableSizes: [],
    ),
    Product(
      name: 'Jersey 2',
      description: 'This is the description for jersey 2.',
      price: 300000,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Jersey',
      availableSizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      name: 'Merchandise 2',
      description: 'This is the description for merchandise 2.',
      price: 300000,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Merchandise',
      availableSizes: [],
    ),
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = selectedCategory == 'All'
        ? products
        : products
            .where((product) => product.category == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Katalog'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Kategori: '),
                DropdownButton<String>(
                  value: selectedCategory,
                  items: <String>['All', 'Jersey', 'Merchandise']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    product: filteredProducts[index],
                    onTap: () {
                      launchWhatsAppOrder();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    product.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                          'Rp.${formatCurrency(
                            product.price.toInt(),
                          )}',
                          style: const TextStyle(color: Colors.indigo)),
                      const SizedBox(height: 4.0),
                      Text(
                        product.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
