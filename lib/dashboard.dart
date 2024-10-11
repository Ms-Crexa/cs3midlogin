import 'package:flutter/material.dart';
import 'package:cs3midlogin/models/products.dart';
import 'package:cs3midlogin/services/apiproducts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Products> allProducts = [];
  String selectedCategory = 'All'; // Variable to hold the selected category

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  loadProducts() async {
    List<Products> products = await MealApi().getproductsAPI();
    setState(() {
      allProducts = products;
    });
  }

  List<String> getCategories() {
    // Get unique categories from products
    List<String> categories =
        allProducts.map((product) => product.category).toSet().toList();
    categories.insert(0, 'All'); // Add 'All' category for showing all products
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    List<Products> filteredProducts = selectedCategory == 'All'
        ? allProducts
        : allProducts
            .where((product) => product.category == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Dashboard'),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButton<String>(
              value: selectedCategory,
              icon: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Icon(Icons.filter_list),
              ),
              underline: const SizedBox(),
              style: const TextStyle(color: Colors.black),
              items: getCategories().map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(category),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
            ),
          ),
        ],
      ),
      body: Container(
        width: screenwidth,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: filteredProducts.map((product) {
              return ProductCard(product: product);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Products product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(20),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      widget.product.category,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 209, 3),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.product.rate.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Image section
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.network(
                      widget.product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // Title
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.product.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Description with "Show more" / "Show less"
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.description,
                      maxLines: isExpanded ? null : 2,
                      overflow: isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? "Show less" : "Show more",
                        style: const TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Price and Buy button
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.product.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Buy',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
