import 'package:domain/entities/customer.dart';
import 'package:domain/entities/delivery_courier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/data_sources/order_object_box_data_source_impl.dart';
import 'package:infrastructure/repositories/order_repository_impl.dart';
import 'package:objectbox/objectbox.dart';

import 'models/order_builder.dart';
import 'object_box_env/test_env.dart';

void main() {
  late Store store;
  late TestEnv env;

  setUp(() {
    env = TestEnv('relation-tests');
    store = env.store;
  });

  tearDown(() {
    env.closeAndDelete();
  });

  test('getOrderList_customerInstance_success', () async {
    // Arrange
    final order = OrderBuilder().build();
    final repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
    repository.save(order);

    // Act
    final result = await repository.getOrderList();

    // Assert
    expect(result.first.customer, isA<Customer>());
  });

  test('getOrderList_deliveryCourierInstance_success', () async {
    // Arrange
    final order = OrderBuilder().build();
    final repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
    repository.save(order);

    // Act
    final result = await repository.getOrderList();

    // Assert
    expect(result.first.deliveryCourier, isA<DeliveryCourier>());
  });

  test('getOrderList_deliveryCourierName_success', () async {
    // Arrange
    const expectedName = "Delivery Courier in test";
    final order = OrderBuilder()
        .withDeliveryCourier(const DeliveryCourier(0, expectedName))
        .build();
    final repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
    repository.save(order);

    // Act
    final result = await repository.getOrderList();

    // Assert
    expect(result.first.deliveryCourier.name, expectedName);
  });

  test('getOrderList_customerName_success', () async {
    // Arrange
    const expectedName = "Customer name";
    final order =
        OrderBuilder().withCustomer(const Customer(0, expectedName)).build();
    final repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
    repository.save(order);

    // Act
    final result = await repository.getOrderList();

    // Assert
    expect(result.first.customer.name, expectedName);
  });
}
