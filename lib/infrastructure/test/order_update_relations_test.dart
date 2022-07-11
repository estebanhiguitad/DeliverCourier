import 'package:domain/entities/customer.dart';
import 'package:domain/entities/delivery_courier.dart';
import 'package:domain/entities/order.dart' as domain;
import 'package:domain/repositories/order_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/data_sources/order_object_box_data_source_impl.dart';
import 'package:infrastructure/repositories/order_repository_impl.dart';
import 'package:objectbox/objectbox.dart';

import 'models/order_builder.dart';
import 'object_box_env/test_env.dart';

void main() {
  late Store store;
  late TestEnv env;
  late OrderRepository repository;

  setUp(() {
    env = TestEnv('relation-tests');
    store = env.store;
    repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
  });

  tearDown(() {
    env.closeAndDelete();
  });

  test('getOrderList_customerUpdatedName_success', () async {
    // Arrange
    final order = OrderBuilder().build();
    repository.save(order);
    const expectedName = "New Customer for Order";
    final oldOrder = await repository.getAnOrder(1);
    final newOrder = domain.Order(
        oldOrder.id,
        oldOrder.state,
        oldOrder.description,
        oldOrder.price,
        oldOrder.startAddress,
        oldOrder.endAddress,
        customer: const Customer(0, expectedName));

    // Act
    await repository.updateOrder(newOrder);
    final result = await repository.getOrderList();

    // Assert
    expect(result.first.customer.name, expectedName);
  });

  test('getOrderList_deliveryCourierUpdatedName_success', () async {
    // Arrange
    final order = OrderBuilder().build();
    repository.save(order);
    const expectedName = "New Delivery Courier for Order";
    final oldOrder = await repository.getAnOrder(1);
    final newOrder = domain.Order(
        oldOrder.id,
        oldOrder.state,
        oldOrder.description,
        oldOrder.price,
        oldOrder.startAddress,
        oldOrder.endAddress,
        deliveryCourier: const DeliveryCourier(0, expectedName));

    // Act
    await repository.updateOrder(newOrder);
    final result = await repository.getOrderList();

    // Assert
    expect(result.first.deliveryCourier.name, expectedName);
  });
}
