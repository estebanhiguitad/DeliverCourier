import 'package:domain/entities/order.dart';
import 'package:domain/value_object/order_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/data_sources/order_object_box_data_source_impl.dart';
import 'package:infrastructure/objectbox/customer_entity.dart';
import 'package:infrastructure/objectbox/delivery_couriers_entity.dart';
import 'package:infrastructure/objectbox/order_entity.dart';
import 'package:infrastructure/repositories/order_repository_impl.dart';
import 'package:objectbox/objectbox.dart' as object_box;

import 'models/order_builder.dart';
import 'object_box_env/test_env.dart';

void main() {
  late object_box.Store store;
  late TestEnv env;

  setUp(() async {
    env = TestEnv('orders');
    store = env.store;

    store.box<OrderEntity>().removeAll();
    store.box<CustomerEntity>().removeAll();
    store.box<DeliveryCourierEntity>().removeAll();
  });

  tearDown(() {
    env.closeAndDelete();
  });

  test('save_order_success', () async {
    // Arrange
    final repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
    Order order = OrderBuilder().build();

    // Act
    await repository.save(order);
    final result = await repository.getOrderList();
    final savedOrder = result.first;

    // Assert
    expect(savedOrder.startAddress, order.startAddress);
  });

  test('save_save2orders_success', () async {
    // Arrange
    final repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
    Order orderOne = OrderBuilder().build();
    Order orderTwo =
        OrderBuilder().withDescription("This is other order").build();

    // Act
    await repository.save(orderOne);
    await repository.save(orderTwo);
    final result = await repository.getOrderList();

    // Assert
    expect(result.length, 2);
  });

  test('getOrderList_get4OrderList_success', () async {
    // Arrange
    final repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
    Order orderOne = OrderBuilder().build();
    Order orderTwo = OrderBuilder().build();
    Order orderThree = OrderBuilder().build();
    Order orderFour = OrderBuilder().build();
    Order orderFive = OrderBuilder().build();

    // Act
    await repository.save(orderOne);
    await repository.save(orderTwo);
    await repository.save(orderThree);
    await repository.save(orderFour);
    await repository.save(orderFive);
    final result = await repository.getOrderList();

    // Assert
    expect(result.length, 5);
  });

  test('update_order_success', () async {
    // Arrange
    final repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
    Order order =
        OrderBuilder().withId(1).withState(OrderState.received).build();
    await repository.save(order);
    final savedOrder = await repository.getAnOrder(1);
    savedOrder.changeStateToNext();

    // Act
    await repository.updateOrder(savedOrder);
    final result = await repository.getAnOrder(1);

    // Assert
    expect(result.state, OrderState.onWay);
  });

  test('getAnOrder_order_success', () async {
    // Arrange
    final repository = OrderRepositoryImpl(OrderObjectBoxDataSourceImpl(store));
    Order order = OrderBuilder().build();
    // Act
    await repository.save(order);
    final savedOrders = await repository.getOrderList();
    final orderToReview = savedOrders
        .firstWhere((element) => element.description == order.description);

    // Assert
    expect(order.description, orderToReview.description);
  });
}
