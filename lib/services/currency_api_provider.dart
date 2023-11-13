import 'dart:convert';
import '../model/currency.dart';
import 'package:http/http.dart' as http;

class CurrencyProvider {

  Future<List<Currency>> getCurrency() async {
    final response = await http.get(Uri.parse('https://api.nbrb.by/exrates/rates?periodicity=0'));

    if (response.statusCode == 200) {
      final List<dynamic> currencyJson = json.decode(response.body);
      return currencyJson.map((json) => Currency.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}