import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class CartProvider with ChangeNotifier {

  int _cartLength = 0;
  double _totalPrice = 0;

  CartProvider({required int length, required double price}) {
    _cartLength = length;
    _totalPrice = price;
  }

  int get cartLength => _cartLength;

  void set cartLength(int value) {
    _cartLength = value;
    notifyListeners();
  }

  double get totalPrice => _totalPrice;

  void set totalPrice(double value) {
    _totalPrice = value;
    notifyListeners();
  }
}


  //
  // Future<List<FeaturedStoresResponse>> getFeaturedStoresData() async {
  //   var url = Uri.parse('https://www.findbestvouchers.com/ApiController/featured_stores');
  //   var response = await http.get(url);
  //
  //   if (response.statusCode == 200)
  //   {
  //     var data = json.decode(response.body) as List;
  //     _featuredStores = data.map((store) => FeaturedStoresResponse.fromJson(store)).toList();
  //     notifyListeners();
  //     return _featuredStores;
  //   } else {
  //     throw Exception('Failed to retrieve Featured Store Data');
  //   }
  // }
