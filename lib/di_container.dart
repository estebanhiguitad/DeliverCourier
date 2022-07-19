import 'package:delivery/presentation/new_order/bloc/new_order_bloc.dart';
import 'package:domain/use_cases/save_new_order.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future initDiContainer() async {
  serviceLocator.registerFactory(() => NewOrderBloc(serviceLocator()));

  serviceLocator.registerLazySingleton(() => SaveNewOrder(serviceLocator()));
}
