import 'package:domain/domain.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/order_builder.dart';
import '../repositories/order_repository_fake.dart';

void main() {
  test('save_success', () async {
    // Arrange
    final Order order = OrderBuilder().withId(1).build();
    OrderRepository repository = OrderRepositoryFake([order]);
    final service = SaveNewOrder(repository);

    // Act
    service(order);
    final result = await repository.getOrderList();

    // Assert
    expect(result.first.uid, order.uid);
  });
}
