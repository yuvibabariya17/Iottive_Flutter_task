// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsonString);

import 'dart:convert';

HomeScreenModel homeScreenModelFromJson(String str) =>
    HomeScreenModel.fromJson(json.decode(str));

String homeScreenModelToJson(HomeScreenModel data) =>
    json.encode(data.toJson());

class HomeScreenModel {
  bool success;
  List<HomeList> data;

  HomeScreenModel({
    required this.success,
    required this.data,
  });

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) =>
      HomeScreenModel(
        success: json["success"],
        data:
            List<HomeList>.from(json["data"].map((x) => HomeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HomeList {
  int date;
  String orderId;
  double paidAmount;
  double discountAmount;
  int redeemedRewards;
  String coolerId;
  PaymentStatus paymentStatus;
  int amountDeductedByRewardPoint;
  double amountDeductedByPaymentGateway;
  List<Product> product;

  HomeList({
    required this.date,
    required this.orderId,
    required this.paidAmount,
    required this.discountAmount,
    required this.redeemedRewards,
    required this.coolerId,
    required this.paymentStatus,
    required this.amountDeductedByRewardPoint,
    required this.amountDeductedByPaymentGateway,
    required this.product,
  });

  factory HomeList.fromJson(Map<String, dynamic> json) => HomeList(
        date: json["date"],
        orderId: json["orderID"],
        paidAmount: json["paidAmount"],
        discountAmount: json["discountAmount"],
        redeemedRewards: json["redeemedRewards"],
        coolerId: json["coolerId"],
        paymentStatus: paymentStatusValues.map[json["paymentStatus"]]!,
        amountDeductedByRewardPoint: json["amountDeductedByRewardPoint"],
        amountDeductedByPaymentGateway: json["amountDeductedByPaymentGateway"],
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "orderID": orderId,
        "paidAmount": paidAmount,
        "discountAmount": discountAmount,
        "redeemedRewards": redeemedRewards,
        "coolerId": coolerId,
        "paymentStatus": paymentStatusValues.reverse[paymentStatus],
        "amountDeductedByRewardPoint": amountDeductedByRewardPoint,
        "amountDeductedByPaymentGateway": amountDeductedByPaymentGateway,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

enum PaymentStatus { COMPLETED }

final paymentStatusValues = EnumValues({"Completed": PaymentStatus.COMPLETED});

class Product {
  String productName;
  int productId;
  double perProductPrice;
  int productCount;
  String productOtherUrl;
  String productLocalName;
  CurrencyCode currencyCode;
  CurrencyName currencyName;
  String shortName;
  FlavourName flavourName;
  PackagingType packagingType;

  Product({
    required this.productName,
    required this.productId,
    required this.perProductPrice,
    required this.productCount,
    required this.productOtherUrl,
    required this.productLocalName,
    required this.currencyCode,
    required this.currencyName,
    required this.shortName,
    required this.flavourName,
    required this.packagingType,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["productName"],
        productId: json["productId"],
        perProductPrice: json["perProductPrice"]?.toDouble(),
        productCount: json["productCount"],
        productOtherUrl: json["productOtherUrl"],
        productLocalName: json["productLocalName"],
        currencyCode: currencyCodeValues.map[json["currencyCode"]]!,
        currencyName: currencyNameValues.map[json["currencyName"]]!,
        shortName: json["shortName"],
        flavourName: flavourNameValues.map[json["flavourName"]]!,
        packagingType: packagingTypeValues.map[json["packagingType"]]!,
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productId": productId,
        "perProductPrice": perProductPrice,
        "productCount": productCount,
        "productOtherUrl": productOtherUrl,
        "productLocalName": productLocalName,
        "currencyCode": currencyCodeValues.reverse[currencyCode],
        "currencyName": currencyNameValues.reverse[currencyName],
        "shortName": shortName,
        "flavourName": flavourNameValues.reverse[flavourName],
        "packagingType": packagingTypeValues.reverse[packagingType],
      };
}

enum CurrencyCode { EMPTY, EUR, INR, USD }

final currencyCodeValues = EnumValues({
  "": CurrencyCode.EMPTY,
  "EUR": CurrencyCode.EUR,
  "INR": CurrencyCode.INR,
  "USD": CurrencyCode.USD
});

enum CurrencyName { EMPTY, EURO, INDIAN_RUPEE, US_DOLLAR }

final currencyNameValues = EnumValues({
  "": CurrencyName.EMPTY,
  "Euro": CurrencyName.EURO,
  "Indian Rupee": CurrencyName.INDIAN_RUPEE,
  "US Dollar": CurrencyName.US_DOLLAR
});

enum FlavourName {
  AFRICAN_INDIAN_ASSAM,
  BITO,
  BLACK,
  CAFE_AU_LAIT,
  COFFEE,
  COLA,
  EMPTY,
  GOLD,
  JUICE,
  LIME,
  NO_SUGAR,
  ORANGE,
  PEACH,
  PEAR_MANGO_PINEAPPLE,
  SPORTS,
  TEA,
  WATER,
  WATER_UNFLAVORED
}

final flavourNameValues = EnumValues({
  "African Indian Assam": FlavourName.AFRICAN_INDIAN_ASSAM,
  "BITO": FlavourName.BITO,
  "Black": FlavourName.BLACK,
  "Cafe Au Lait": FlavourName.CAFE_AU_LAIT,
  "Coffee": FlavourName.COFFEE,
  "Cola": FlavourName.COLA,
  "": FlavourName.EMPTY,
  "GOLD": FlavourName.GOLD,
  "Juice": FlavourName.JUICE,
  "Lime": FlavourName.LIME,
  "No Sugar": FlavourName.NO_SUGAR,
  "Orange": FlavourName.ORANGE,
  "Peach": FlavourName.PEACH,
  "Pear Mango Pineapple": FlavourName.PEAR_MANGO_PINEAPPLE,
  "SPORTS": FlavourName.SPORTS,
  "Tea": FlavourName.TEA,
  "Water": FlavourName.WATER,
  "Water (Unflavored)": FlavourName.WATER_UNFLAVORED
});

enum PackagingType {
  CAN,
  EMPTY,
  PACKAGING_TYPE_500_ML_PET,
  PET,
  PURPLE_500_ML_PET,
  THE_1000_ML_NRG,
  THE_12_L_PET,
  THE_1_L_PET,
  THE_235_ML_CAN,
  THE_250_ML_CARDBOARD_BOX,
  THE_260_ML_BOTTLE_CAN,
  THE_470_ML_PET,
  THE_500_ML_PET,
  THE_500_ML_TRANSPORT_BOX,
  THE_550_ML_PORTABLE,
  THE_600_ML_PET
}

final packagingTypeValues = EnumValues({
  "CAN": PackagingType.CAN,
  "": PackagingType.EMPTY,
  "500 ml Pet": PackagingType.PACKAGING_TYPE_500_ML_PET,
  "PET": PackagingType.PET,
  "500 ML PET": PackagingType.PURPLE_500_ML_PET,
  "1000ml NRG": PackagingType.THE_1000_ML_NRG,
  "1.2L Pet": PackagingType.THE_12_L_PET,
  "1L Pet": PackagingType.THE_1_L_PET,
  "235ml Can": PackagingType.THE_235_ML_CAN,
  "250ml Cardboard Box": PackagingType.THE_250_ML_CARDBOARD_BOX,
  "260ml BOTTLE CAN": PackagingType.THE_260_ML_BOTTLE_CAN,
  "470 ml Pet": PackagingType.THE_470_ML_PET,
  "500ml PET ": PackagingType.THE_500_ML_PET,
  "500ml Transport Box": PackagingType.THE_500_ML_TRANSPORT_BOX,
  "550ml Portable": PackagingType.THE_550_ML_PORTABLE,
  "600ml Pet": PackagingType.THE_600_ML_PET
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
