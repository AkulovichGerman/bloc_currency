import '../model/currency.dart';
import 'currency_api_provider.dart';

class CurrencyRepository {
  final CurrencyProvider _currencyProvider = CurrencyProvider();
  Future<List<Currency>> getAllCurrencies() => _currencyProvider.getCurrency();
}