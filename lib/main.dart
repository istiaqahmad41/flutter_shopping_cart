import 'package:flutter/material.dart';

void main() {
  runApp( shoping_cart());
}

//---1
/*class shoping_cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart with Payment Gateway',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List of available items
  List<Map<String, dynamic>> items = [
    {"name": "Laptop", "price": 30.0},
    {"name": "Mouse", "price": 50.0},
    {"name": "Keyboard", "price": 20.0},
    {"name": "Monitor", "price": 15.0},
    {"name": "RAM", "price": 100.0},
  ];

  // Cart items
  List<Map<String, dynamic>> cart = [];

  // Function to add an item to the cart
  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cart.add(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${item['name']} added to cart!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item["name"]),
            subtitle: Text("\$${item["price"].toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                addToCart(item);
              },
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;

  CartPage({required this.cart});

  double calculateTotal() {
    double total = 0;
    for (var item in cart) {
      total += item['price'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  title: Text(item["name"]),
                  subtitle: Text("\$${item["price"].toStringAsFixed(2)}"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total: \$${calculateTotal().toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentPage(totalAmount: calculateTotal()),
                  ),
                );
              },
              child: Text('Proceed to Payment'),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final double totalAmount;

  PaymentPage({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Gateway'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total to Pay: \$${totalAmount.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate a successful payment
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Payment Successful!")),
                );
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}*/
//--19----cart version 2



class shoping_cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> items = [
    {"name": "Item 1", "price": 20.0},
    {"name": "Item 2", "price": 15.0},
    {"name": "Item 3", "price": 30.0},
    {"name": "Item 4", "price": 45.0},
    {"name": "Item 5", "price": 25.0},
  ];

  List<Map<String, dynamic>> cart = [];
  double discount = 0;

  // Function to add item to the cart
  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cart.add(item);
    });
  }

  // Function to calculate total price
  double getTotalPrice() {
    return cart.fold(0.0, (sum, item) => sum + item['price']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Items'),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (cart.length > 0)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        cart.length.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              // Navigate to Cart Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    cart: cart,
                    discount: discount,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(items[index]['name']),
              subtitle: Text('Price: \$${items[index]['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  addToCart(items[index]);
                },
                child: Text("Add to Cart"),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  final double discount;

  CartPage({required this.cart, required this.discount});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double promoDiscount = 0;
  TextEditingController promoController = TextEditingController();

  // Function to calculate total price after discount
  double calculateTotal() {
    double totalPrice = widget.cart.fold(0.0, (sum, item) => sum + item['price']);
    double finalPrice = totalPrice - (totalPrice * promoDiscount);
    return finalPrice;
  }

  // Function to apply promo code
  void applyPromo() {
    String promoCode = promoController.text;

    // Check if the promo code is valid (for example "DISCOUNT10")
    if (promoCode == "DISCOUNT10") {
      setState(() {
        promoDiscount = 0.1; // 10% discount
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Promo code applied: 10% discount')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid promo code')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.cart[index]['name']),
                  subtitle: Text('Price: \$${widget.cart[index]['price']}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: promoController,
              decoration: InputDecoration(
                labelText: 'Promo Code',
                suffixIcon: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: applyPromo,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${calculateTotal().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Checkout Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(total: calculateTotal()),
                ),
              );
            },
            child: Text("Proceed to Checkout"),
          ),
        ],
      ),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  final double total;

  CheckoutPage({required this.total});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController addressController = TextEditingController();

  // Simulate payment gateway process
  void completePayment() {
    if (addressController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment Successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your address')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total to Pay: \$${widget.total.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Enter your address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: completePayment,
                child: Text('Complete Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

