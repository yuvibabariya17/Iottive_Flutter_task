import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Controllers/HomeScreenController.dart';
import 'package:iottive_flutter_task/Controllers/LoginScreenController.dart';
import 'package:iottive_flutter_task/Core/Common/appbar.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:iottive_flutter_task/Core/Themes/font_constant.dart';
import 'package:iottive_flutter_task/Models/HomeScreenModel.dart';
import 'package:iottive_flutter_task/Utils/log.dart';
import 'package:iottive_flutter_task/Views/Home/ProductDetailScreen.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeScreenController());

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    logcat("DATE:::::::", controller.filteredHomeList.length);
    controller.filteredHomeList = controller.serviceObjectList;
    controller.getServiceList(context);
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
    return Scaffold(
        body:
            // OrientationBuilder(builder: (context, orientation) {
            // if (orientation == Orientation.landscape) {
            //   SystemChrome.setPreferredOrientations([
            //     DeviceOrientation.landscapeLeft,
            //     DeviceOrientation.landscapeRight,
            //   ]);
            // } else {
            //   SystemChrome.setPreferredOrientations([
            //     DeviceOrientation.portraitUp,
            //     DeviceOrientation.portraitDown,
            //   ]);
            // }
            Container(
      margin: EdgeInsets.only(top: 5.h),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getCommonToolbar("Home", () {
              // Get.back();
            }),
            Container(
              width: double.infinity,
              color: black,
              height: 0.2.h,
            ),
            // Container(
            //     margin: EdgeInsets.only(
            //       top: 5.h,
            //     ),
            //     child: Text(
            //       "Home",
            //       style: TextStyle(fontSize: 20.sp),
            //     )),
            Container(
              margin: EdgeInsets.only(
                top: 1.h,
                left: 1.w,
                right: 1.w,
              ),
              padding: EdgeInsets.only(
                left: 6.w,
                right: 6.w,
              ),
              child: SizedBox(
                height: 5.5.h,
                child: TextField(
                  onChanged: ((value) {
                    controller.filterServiceList(value);
                  }),
                  style: const TextStyle(color: black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      top: 1.h,
                      left: 2.h,
                      bottom: 1.h,
                    ),
                    hintText: "Search Here",
                    hintStyle: const TextStyle(color: black),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: black)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: black)),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: SizerUtil.deviceType == DeviceType.mobile
                            ? 2.w
                            : 0.0,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search_sharp,
                            color: black,
                            size: SizerUtil.deviceType == DeviceType.mobile
                                ? null
                                : 3.h,
                          )),
                    ),
                  ),
                  controller: controller.searchCtr,
                  cursorColor: black,
                  keyboardType: TextInputType.name,
                ),
              ),

              // Container(
              //   height: 5.5.h,
              //   child: TextField(
              //     onChanged: ((value) {
              //       filterServiceList(value);
              //     }),
              //     style: const TextStyle(color: black),
              //     decoration: InputDecoration(
              //         contentPadding: EdgeInsets.only(
              //           top: SizerUtil.deviceType == DeviceType.mobile
              //               ? 1.h
              //               : 1.2.h,
              //           left: 2.h,
              //           bottom: SizerUtil.deviceType == DeviceType.mobile
              //               ? 1.h
              //               : 1.2.h,
              //         ),
              //         hintText: "Search Here",
              //         hintStyle: const TextStyle(
              //           color: black,
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(30),
              //             borderSide: const BorderSide(color: black)),
              //         enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(30),
              //             borderSide: const BorderSide(color: black)),
              //         suffixIcon: Padding(
              //           padding: EdgeInsets.only(
              //               right: SizerUtil.deviceType == DeviceType.mobile
              //                   ? 0.0
              //                   : 2.w),
              //           child: IconButton(
              //               onPressed: () {},
              //               icon: Icon(
              //                 Icons.search_sharp,
              //                 color: black,
              //                 size: SizerUtil.deviceType == DeviceType.mobile
              //                     ? null
              //                     : 3.h,
              //               )),
              //         )),
              //     controller: controller.searchCtr,
              //     cursorColor: black,
              //     keyboardType: TextInputType.name,
              //   ),
              // ),
            ),
            Expanded(
              child: RefreshIndicator(
                color: black,
                onRefresh: () {
                  return Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      // controller.getServiceList(context);
                    },
                  );
                },
                child: Scrollbar(
                  trackVisibility: true,
                  thickness: 5,
                  thumbVisibility: true,
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Obx(() {
                          switch (controller.state.value) {
                            case ScreenState.apiLoading:
                            case ScreenState.noNetwork:
                            case ScreenState.noDataFound:
                            case ScreenState.apiError:
                              return Container(
                                margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                                height: SizerUtil.height / 1.5,
                                child: apiOtherStates(controller.state.value),
                              );
                            case ScreenState.apiSuccess:
                              return Container(
                                  margin:
                                      EdgeInsets.only(bottom: 3.h, top: 2.h),
                                  child: apiSuccess(controller.state.value));
                            default:
                              Container();
                          }
                          return Container();
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
    ));
  }

  Widget apiSuccess(ScreenState state) {
    logcat("LENGTH", controller.serviceObjectList.length.toString());
    if (state == ScreenState.apiSuccess &&
        controller.filteredHomeList.isNotEmpty) {
      return Container(child: getServiceList());
    } else {
      return SizedBox(
        height: SizerUtil.height / 1.3,
        child: Center(
          child: Text(
            "Don't Have Data",
            style: TextStyle(
                fontFamily: fontMedium, fontSize: 12.sp, color: black),
          ),
        ),
      );
    }
  }

  getServiceList() {
    return ListView.builder(
      shrinkWrap: true,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.only(bottom: 7.h),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        HomeList data = controller.filteredHomeList[index];

        return Container(
            margin: EdgeInsets.only(
              left: 5.w,
              right: 5.w,
              top: 1.5.h,
              bottom: 0.5.h,
            ),
            padding: EdgeInsets.only(
              left: 3.w,
              right: 3.w,
              top: 1.1.h,
              bottom: 0.5.h,
            ),
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  spreadRadius: 0.1,
                  blurRadius: 10,
                  offset: const Offset(0.5, 0.5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Order Id : ",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w800,
                        color: black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data.orderId.toString(),
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 7.sp,
                            color: black,
                            fontFamily: fontRegular),
                      ),
                    ),
                    // Expanded(
                    //   child: Text(
                    //     "Order Id : ${data.orderId.toString()}",
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: TextStyle(
                    //       color: black,
                    //       fontFamily: opensansMedium,
                    //       fontSize: 7.sp,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     // textAlign: TextAlign.center,
                    //   ),
                    // ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Date : ",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w800,
                        color: black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data.date.toString(),
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 7.sp,
                            color: black,
                            fontFamily: fontRegular),
                      ),
                    ),
                    // Text(
                    //   "Date : ${data.date.toString()}",
                    //   style: TextStyle(
                    //     color: black,
                    //     fontFamily: opensansMedium,
                    //     fontSize: 7.sp,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    SizedBox(width: 1.w),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Amount : ",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w800,
                        color: black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data.paidAmount.toString(),
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 7.sp,
                            color: black,
                            fontFamily: fontRegular),
                      ),
                    ),
                    // Text(
                    //   "Amount : ${data.paidAmount.toString()}",
                    //   style: TextStyle(
                    //     color: black,
                    //     fontFamily: opensansMedium,
                    //     fontSize: 7.sp,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    SizedBox(width: 1.w),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Status : ",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w800,
                        color: black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data.paymentStatus.toString(),
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 7.sp,
                            color: black,
                            fontFamily: fontRegular),
                      ),
                    ),
                    // Text(
                    //   "Status : ${data.paymentStatus.toString()}",
                    //   style: TextStyle(
                    //     color: black,
                    //     fontFamily: opensansMedium,
                    //     fontSize: 7.sp,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    SizedBox(width: 1.w),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "No.of Product : ",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w800,
                        color: black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data.product.length.toString(),
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 7.sp,
                            color: black,
                            fontFamily: fontRegular),
                      ),
                    ),
                    // Text(
                    //   "No.of Product : ${data.product.length.toString()}",
                    //   style: TextStyle(
                    //     color: black,
                    //     fontFamily: opensansMedium,
                    //     fontSize: 7.sp,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    SizedBox(width: 1.w),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Product Name : ",
                //       style: TextStyle(
                //         fontSize: 8.sp,
                //         fontWeight: FontWeight.w800,
                //         color: black,
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.product[index].productName,
                //         style: TextStyle(
                //           fontSize: 7.sp,
                //           color: black,
                //           fontFamily: fontRegular,
                //         ),
                //       ),
                //     ),
                //
                //     SizedBox(width: 1.w),
                //   ],
                // ),
                const Divider(
                  // indent: double.infinity,
                  // endIndent: double.infinity,
                  color: black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 8.h,
                        width: double.infinity,
                        child: Scrollbar(
                          trackVisibility: true,
                          thickness: 5,
                          thumbVisibility: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: data.product.length,
                            itemBuilder: (context, imageIndex) {
                              return Padding(
                                padding: EdgeInsets.only(right: 2.w, left: 2.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAlias,
                                  child: GestureDetector(
                                    onTap: () {
                                      Product tappedProduct =
                                          data.product[imageIndex];
                                      String imageUrl = data
                                          .product[imageIndex].productOtherUrl;
                                      Get.to(ProductDetailsScreen(
                                        product: tappedProduct,
                                        imageUrl: imageUrl,
                                      ));
                                      //print("CLICKKKK::");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.network(
                                        data.product[imageIndex]
                                            .productOtherUrl,
                                        width: 25.w,
                                        height: 6.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 2.h,
                )
              ],
            ));
      },
      itemCount: controller.filteredHomeList.length,
    );
  }

  Widget apiOtherStates(state) {
    if (state == ScreenState.apiLoading) {
      return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(child: Text("loading..."))
          //     Image.asset(
          //   "assets/gifs/apiloader.gif",
          //   width: 50,
          //   height: 50,
          //   fit: BoxFit.cover,
          // ),
          );
    }

    Widget? button;
    // if (controller.filterList.isEmpty) {
    //   Container();
    // }
    if (state == ScreenState.noDataFound) {
      button = getMiniButton(() {
        Get.back();
      }, "Back");
    }
    if (state == ScreenState.noNetwork) {
      button = getMiniButton(() {
        // controller.getServiceList(
        //   context,
        // );
      }, "Try Again");
    }

    if (state == ScreenState.apiError) {
      button = getMiniButton(() {
        Get.back();
      }, "Back");
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            " controller.message.value,",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: fontMedium, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }

  getMiniButton(
    Function fun,
    str,
  ) {
    return InkWell(
      onTap: () {
        fun();
      },
      child: Container(
        height: SizerUtil.deviceType == DeviceType.mobile ? 5.h : 4.5.h,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 1),
        width: SizerUtil.width / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: lightPrimaryColor,
          boxShadow: [
            BoxShadow(
                color: primaryColor.withOpacity(0.2),
                blurRadius: 10.0,
                offset: const Offset(0, 1),
                spreadRadius: 3.0)
          ],
        ),
        child: Text(
          str,
          style: TextStyle(
              color: Colors.white,
              fontFamily: fontBold,
              fontSize:
                  SizerUtil.deviceType == DeviceType.mobile ? 11.sp : 8.sp),
        ),
      ),
    );
  }
}
