import 'package:delivery/presentation/list_orders/bloc/list_orders_bloc.dart';
import 'package:delivery/presentation/new_order/bloc/new_order_bloc.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:domain/use_cases/get_list_order.dart';
import 'package:domain/use_cases/save_new_order.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/infrastructure.dart';

final serviceLocator = GetIt.I;

Future initDiContainer() async {
  serviceLocator.registerFactory(() => NewOrderBloc(serviceLocator()));

  serviceLocator.registerLazySingleton(() => SaveNewOrder(serviceLocator()));

  serviceLocator.registerFactory(() => ListOrdersBloc(serviceLocator()));

  serviceLocator.registerLazySingleton(() => GetListOrder(serviceLocator()));

  serviceLocator.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryHive(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(() => OrderHiveBox(serviceLocator()));

  serviceLocator.registerLazySingleton(() => OrderHiveMapper());
}
