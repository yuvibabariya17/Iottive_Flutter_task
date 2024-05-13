import 'package:flutter/material.dart';

class TransactionItem {
  final String id;
  final String date;
  final String amount;
  final String status;
  final String product;
  final List<String> images;

  TransactionItem({
    required this.id,
    required this.date,
    required this.amount,
    required this.status,
    required this.product,
    required this.images,
  });
}

List<TransactionItem> transactionitem = [
  TransactionItem(
    id: '1',
    date: "12 March 2022",
    amount: "24",
    status: "xyz",
    product: "13",
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_32jsd16wqbA_xW51Tu0y3BjGmC_Sardcag&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDrgILEvvnwMHO6f9FP7XHvFHax-0CaK0L4A&usqp=CAU'
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDrgILEvvnwMHO6f9FP7XHvFHax-0CaK0L4A&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDrgILEvvnwMHO6f9FP7XHvFHax-0CaK0L4A&usqp=CAU'

    ],
  ),
  TransactionItem(
    id: '1',
    date: "12 March 2022",
    amount: "24",
    status: "xyz",
    product: "13",
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_32jsd16wqbA_xW51Tu0y3BjGmC_Sardcag&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDrgILEvvnwMHO6f9FP7XHvFHax-0CaK0L4A&usqp=CAU'
    ],
  ),
  TransactionItem(
    id: '1',
    date: "12 March 2022",
    amount: "24",
    status: "xyz",
    product: "13",
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_32jsd16wqbA_xW51Tu0y3BjGmC_Sardcag&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDrgILEvvnwMHO6f9FP7XHvFHax-0CaK0L4A&usqp=CAU'
    ],
  ),
  TransactionItem(
    id: '1',
    date: "12 March 2022",
    amount: "24",
    status: "xyz",
    product: "13",
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_32jsd16wqbA_xW51Tu0y3BjGmC_Sardcag&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDrgILEvvnwMHO6f9FP7XHvFHax-0CaK0L4A&usqp=CAU'
    ],
  ),
  TransactionItem(
    id: '1',
    date: "12 March 2022",
    amount: "24",
    status: "xyz",
    product: "13",
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_32jsd16wqbA_xW51Tu0y3BjGmC_Sardcag&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDrgILEvvnwMHO6f9FP7XHvFHax-0CaK0L4A&usqp=CAU'
    ],
  ),
  TransactionItem(
    id: '1',
    date: "12 March 2022",
    amount: "24",
    status: "xyz",
    product: "13",
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_32jsd16wqbA_xW51Tu0y3BjGmC_Sardcag&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDrgILEvvnwMHO6f9FP7XHvFHax-0CaK0L4A&usqp=CAU'
    ],
  ),
];
