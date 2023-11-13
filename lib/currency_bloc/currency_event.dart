import '../model/currency.dart';

abstract class CurrencyEvent {}

class CurrencyLoadEvent extends CurrencyEvent {}

class CurrencyClearEvent extends CurrencyEvent {}

class CurrencyOnChangeEvent extends CurrencyEvent {
  List<Currency> changedCurrency;
  String query;

  CurrencyOnChangeEvent({
    required this.changedCurrency, required this.query
  });
}