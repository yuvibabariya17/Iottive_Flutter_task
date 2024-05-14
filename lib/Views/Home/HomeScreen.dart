import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Controllers/HomeScreenController.dart';
import 'package:iottive_flutter_task/Controllers/LoginScreenController.dart';
import 'package:iottive_flutter_task/Core/Common/appbar.dart';
import 'package:iottive_flutter_task/Core/Constant/String_Constant.dart';
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
    controller.filteredHomeList = controller.homeObjectList;
    controller.getHomeList(context);
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
        body: Container(
      margin: EdgeInsets.only(top: 5.h),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getToolbar(Strings.homeTitle, () {}, Strings.logOutBtn, () {
              PopupDialogs(context);
            }),
            SizedBox(
              height: 1.h,
            ),
            Container(
              width: double.infinity,
              color: black,
              height: 0.1.h,
            ),
            GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: 2.h,
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
                      controller.filterHomeList(value);
                    }),
                    style: const TextStyle(color: black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 1.h,
                        left: 2.h,
                        bottom: 1.h,
                      ),
                      hintText: Strings.search,
                      hintStyle: TextStyle(
                        color: black.withOpacity(0.6),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: black)),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search_sharp,
                              color: black,
                            )),
                      ),
                    ),
                    controller: controller.searchCtr,
                    cursorColor: black,
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
            ),
            Expanded(child: Obx(() {
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
                      margin: EdgeInsets.only(bottom: 3.h, top: 2.h),
                      child: apiSuccess(controller.state.value));
                default:
                  Container();
              }
              return Container();
            })),
          ]),
    ));
  }

  Widget apiSuccess(ScreenState state) {
    logcat("LENGTH", controller.homeObjectList.length.toString());
    if (state == ScreenState.apiSuccess &&
        controller.filteredHomeList.isNotEmpty) {
      return getServiceList();
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
    return Scrollbar(
      controller: ScrollController(),
      trackVisibility: true,
      thickness: 10,
      interactive: true,
      radius: Radius.circular(16),
      thumbVisibility: true,
      child: ListView.builder(
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
                      SizedBox(width: 1.w),
                    ],
                  ),
                  const Divider(
                    color: black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 8.5.h,
                          width: double.infinity,
                          child: Scrollbar(
                            controller: ScrollController(),
                            trackVisibility: true,
                            thickness: 7,
                            radius: const Radius.circular(10),
                            thumbVisibility: true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: data.product.length,
                              itemBuilder: (context, imageIndex) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: 2.5.w, bottom: 3.5.w),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    clipBehavior: Clip.antiAlias,
                                    child: GestureDetector(
                                      onTap: () {
                                        Product tappedProduct =
                                            data.product[imageIndex];
                                        String imageUrl = data
                                            .product[imageIndex]
                                            .productOtherUrl;
                                        Get.to(ProductDetailsScreen(
                                          product: tappedProduct,
                                          imageUrl: imageUrl,
                                        ));
                                        //print("CLICKKKK::");
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: black,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  blurRadius: 10.0,
                                                  offset: const Offset(0, 1),
                                                  spreadRadius: 3.0)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.network(
                                          data.product[imageIndex]
                                              .productOtherUrl,
                                          width: 22.w,
                                          height: 4.h,
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
      ),
    );
  }

  Widget apiOtherStates(state) {
    if (state == ScreenState.apiLoading) {
      return Center(
        child: ClipOval(
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              "assets/gifs/apiloader.gif",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
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
        height: 5.h,
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
              color: Colors.white, fontFamily: fontBold, fontSize: 11.sp),
        ),
      ),
    );
  }
}
