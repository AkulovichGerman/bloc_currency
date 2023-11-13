import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/currency.dart';
import '../services/currency_repository.dart';

import 'currency_event.dart';
import 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository currencyRepository;
  CurrencyBloc({required this.currencyRepository}) : super(CurrencyEmptyState()) {
    on<CurrencyLoadEvent>(
          (event, emit) async {
        emit(CurrencyLoadingState());

        try {
          final List<Currency> loadedCurrencyList = await currencyRepository.getAllCurrencies();
          emit(CurrencyLoadedState(loadedCurrency: loadedCurrencyList));

        } catch (_) {
          emit(CurrencyErrorState());
        }
      },
    );
    on<CurrencyClearEvent>(
          (event, emit) async {
        emit(CurrencyEmptyState());
      },
    );
    // on<CurrencyOnChangeEvent>(
    //       (event, emit) async {
    //     emit(CurrencyOnChangeState());
    //   },
    // );
  }
}