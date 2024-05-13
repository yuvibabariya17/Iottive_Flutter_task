import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iottive_flutter_task/Core/Common/appbar.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:iottive_flutter_task/Models/HomeScreenModel.dart';
import 'package:iottive_flutter_task/core/themes/font_constant.dart';
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
      body: Column(
        children: [
          getCommonToolbar("Product Details", () {
            Get.back();
          }),
          orientation == Orientation.landscape
              ? _buildLandscapeView()
              : _buildPortraitView(),
        ],
      ),

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
            margin: EdgeInsets.only(left: 5.w, bottom: 1.h),
            height: 70.h,
            width: 100.w,
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
            padding: EdgeInsets.only(left: 1.w, right: 1.w),
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
            margin: EdgeInsets.only(left: 5.w, right: 5.w),
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
            padding: EdgeInsets.only(left: 1.w, right: 1.w),
            child: _buildProductDetails(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return Container(
      margin: EdgeInsets.only(left: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product Name :",
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w800,
              color: black,
            ),
          ),
          Text(
            widget.product.productName.toString(),
            overflow: TextOverflow.visible,
            maxLines: 3,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 7.sp, color: black, fontFamily: fontRegular),
          ),
          SizedBox(height: 1.h),
          // Text(
          //   'Product Name: ${widget.product.productName}',
          //   style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          // ),
          Text(
            "Product ID :",
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w800,
              color: black,
            ),
          ),
          Text(
            widget.product.productId.toString(),
            overflow: TextOverflow.visible,
            maxLines: 3,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 7.sp, color: black, fontFamily: fontRegular),
          ),
          // Text(
          //   'Product ID: ${widget.product.productId}',
          //   style: const TextStyle(fontSize: 16.0),
          // ),
          SizedBox(height: 1.h),

          Text(
            "Price :",
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w800,
              color: black,
            ),
          ),
          Text(
            widget.product.perProductPrice.toStringAsFixed(2),
            overflow: TextOverflow.visible,
            maxLines: 3,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 7.sp, color: black, fontFamily: fontRegular),
          ),
          // Text(
          //   'Price: \$${widget.product.perProductPrice.toStringAsFixed(2)}',
          //   style: const TextStyle(fontSize: 16.0),
          // ),
          SizedBox(height: 1.h),

          Text(
            "Count :",
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w800,
              color: black,
            ),
          ),
          Text(
            widget.product.productCount.toString(),
            overflow: TextOverflow.visible,
            maxLines: 3,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 7.sp, color: black, fontFamily: fontRegular),
          ),
          // Text(
          //   'Count: ${widget.product.productCount}',
          //   style: const TextStyle(fontSize: 16.0),
          // ),
        ],
      ),
    );
  }
}
