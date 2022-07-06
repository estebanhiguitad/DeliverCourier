import 'package:domain/models/order.dart';
import 'package:domain/models/order_state.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:domain/services/state_order_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/order_builder.dart';

void main(){
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

class OrderRepositoryFake implements OrderRepository {
  final List<Order> _list;

  OrderRepositoryFake(this._list);

  @override
  Future<List<Order>> getOrderList() async {
    return _list;
  }

  @override
  Future<Order> getAnOrder(int id) async {
    return _list.firstWhere((element) => element.id == id);
  }

  @override
  void updateOrder(Order order) {
    _list.removeWhere((element) => element.id == order.id);
    _list.add(order);
  }
}