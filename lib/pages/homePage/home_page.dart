import 'package:bloc_example/pages/homePage/widgets/currency_list.dart';
import 'package:bloc_example/services/currency_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../currency_bloc/currency_bloc.dart';
import '../../currency_bloc/currency_event.dart';
import '../../internet_connection_cubit/connection_cubit.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = <String>[];

  @override
  void initState() {
    items = duplicateItems;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CurrencyRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CurrencyBloc(
                currencyRepository: context.read<CurrencyRepository>())
              ..add(CurrencyLoadEvent()),
          ),
          BlocProvider(create: (context) => ConnectionCubit()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<ConnectionCubit, MyConnectionState>(
              builder: (context, state) => state.connected
                  ? const Text('User List (в сети)')
                  : const Text(
                      'Нет соединения с интернет!',
                      style: TextStyle(color: Colors.red),
                    ),
            ),
            centerTitle: true,
          ),
          body:  Column(
            children: <Widget>[
              Expanded(
                child:  CurrencyList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
