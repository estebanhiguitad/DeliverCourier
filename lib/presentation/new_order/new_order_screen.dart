import 'package:delivery/di_container.dart';
import 'package:delivery/presentation/new_order/bloc/new_order_bloc.dart';
import 'package:delivery/presentation/new_order/new_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<NewOrderBloc>(),
      child: NewOrderView(),
    );
  }
}
