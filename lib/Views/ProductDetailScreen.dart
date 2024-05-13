import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:iottive_flutter_task/Models/HomeScreenModel.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  final String imageUrl;

  const ProductDetailsScreen(
      {super.key, required this.product, required this.imageUrl});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: orientation == Orientation.landscape
          ? _buildLandscapeView()
          : _buildPortraitView(),

      //  Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         height: 30.h,
      //         width: 100.w,
      //         color: black,
      //         child: Image.network(
      //           widget.imageUrl,
      //           // width: double.infinity,
      //           // height: 200.0, // Adjust height as needed
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //       SizedBox(
      //         height: 2.h,
      //       ),
      //       Text(
      //         'Product Name: ${widget.product.productName}',
      //         style:
      //             const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      //       ),
      //       const SizedBox(height: 8.0),
      //       Text(
      //         'Product ID: ${widget.product.productId}',
      //         style: const TextStyle(fontSize: 16.0),
      //       ),
      //       const SizedBox(height: 8.0),
      //       Text(
      //         'Price: \$${widget.product.perProductPrice.toStringAsFixed(2)}',
      //         style: const TextStyle(fontSize: 16.0),
      //       ),
      //       Text(
      //         'Count: \$${widget.product.productCount.toStringAsFixed(2)}',
      //         style: const TextStyle(fontSize: 16.0),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildLandscapeView() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 100.h,
            color: black,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildProductDetails(),
          ),
        ),
      ],
    );
  }

  Widget _buildPortraitView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30.h,
            width: 100.w,
            color: black,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildProductDetails(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Name: ${widget.product.productName}',
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Product ID: ${widget.product.productId}',
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Price: \$${widget.product.perProductPrice.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 16.0),
        ),
        Text(
          'Count: ${widget.product.productCount}',
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
