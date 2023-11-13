import 'package:bloc_example/model/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../currency_bloc/currency_bloc.dart';
import '../../../currency_bloc/currency_state.dart';

class CurrencyList extends StatefulWidget {
  CurrencyList({super.key});

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  TextEditingController editingController = TextEditingController();
  late List<Currency> duplicateItems;
  var items = <Currency>[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyBloc, CurrencyState>(
      listener: ((context, state) {
        if (state is CurrencyLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Currencys is Loaded')));
        }
      }),
      builder: (context, state) {
        if (state is CurrencyEmptyState) {
          return const Center(
            child: Text(
              'No data received. Please button "Load"',
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        if (state is CurrencyLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CurrencyLoadedState) {
          duplicateItems = state.loadedCurrency;
          items = state.loadedCurrency;
          return Column(children: [
            searchField(),
            Expanded(
              child: currencyListView(items),
            ),
          ]);
        }

        if (state is CurrencyErrorState) {
          return const Center(
            child: Text(
              'Error fetching Currencys',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  ListView currencyListView(List<Currency> currencyList) {
    return ListView.builder(
      itemCount: currencyList.length,
      itemBuilder: (context, index) => CurrencyCard(
        currency: currencyList[index],
      ),
    );
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          filterSearchResults(value);
        },
        controller: editingController,
        decoration: const InputDecoration(
            labelText: "Search",
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }

  void filterSearchResults(String query) {
    items = duplicateItems
        .where(
            (item) => item.curName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

class CurrencyCard extends StatelessWidget {
  late Currency currency;

  CurrencyCard({super.key, required currency});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        'ID: ${currency.curID}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      title: Column(
        children: [
          Text(
            'ID: ${currency.curAbbreviation}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Email: ${currency.curName}',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            'Phone: ${currency.curOfficialRate}',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            'Phone: ${currency.curScale}',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
