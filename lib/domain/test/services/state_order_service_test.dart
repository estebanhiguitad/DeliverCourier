import 'package:domain/models/order.dart';
import 'package:domain/models/order_state.dart';
import 'package:domain/services/state_order_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/order_builder.dart';
import '../repositories/order_repository_fake.dart';

void main() {
  test('changeOrderState_orderReceived_onWay', () async {
    // Arrange
    final repository = OrderRepositoryFake([OrderBuilder().build()]);
    final service = StateOrderService(repository);
    Order order = OrderBuilder().build();

    // Act
    service.updateOrderState(order);
    final result = await repository.getAnOrder(order.id);

    // Assert
    expect(result.state, OrderState.onWay);
  });

  test('changeOrderState_orderOnWay_orderDelivered', () async {
    // Arrange
    final repository = OrderRepositoryFake([OrderBuilder().build()]);
    final service = StateOrderService(repository);
    Order order = OrderBuilder().withState(OrderState.onWay).build();

    // Act
    service.updateOrderState(order);
    final result = await repository.getAnOrder(order.id);

    // Assert
    expect(result.state, OrderState.delivered);
  });

  test('changeOrderState_orderOnWay_orderDelivered', () async {
    // Arrange
    final repository = OrderRepositoryFake([OrderBuilder().build()]);
    final service = StateOrderService(repository);
    Order order = OrderBuilder().withState(OrderState.onWay).build();

    // Act
    service.updateOrderState(order);
    final result = await repository.getAnOrder(order.id);

    // Assert
    expect(result.state, OrderState.delivered);
  });

  test('changeOrderState_orderOnDelivered_orderDelivered', () async {
    // Arrange
    final repository = OrderRepositoryFake([OrderBuilder().build()]);
    final service = StateOrderService(repository);
    Order order = OrderBuilder().withState(OrderState.delivered).build();

    // Act
    service.updateOrderState(order);
    final result = await repository.getAnOrder(order.id);

    // Assert
    expect(result.state, OrderState.delivered);
  });
}
