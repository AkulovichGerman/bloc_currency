import 'package:bloc_example/model/currency.dart';

abstract class CurrencyState {}

class CurrencyEmptyState extends CurrencyState {}

class CurrencyLoadingState extends CurrencyState {}

class CurrencyLoadedState extends CurrencyState {
  List<Currency> loadedCurrency;
  CurrencyLoadedState({
    required this.loadedCurrency,
  });
}

class CurrencyOnChangeState extends CurrencyState {
  List<Currency> changedCurrency;
  CurrencyOnChangeState({
    required this.changedCurrency,
  });
}

class CurrencyErrorState extends CurrencyState {}