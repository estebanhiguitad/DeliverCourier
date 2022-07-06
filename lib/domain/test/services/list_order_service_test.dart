import 'package:domain/exceptions/no_data_exception.dart';
import 'package:domain/services/list_order_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/order_repository_fake.dart';
import '../repositories/order_repository_stub.dart';

void main() {
  test('getOrderList_success', () async {
    // Arrange
    final service = ListOrderService(OrderRepositoryStub());

    // Act
    final result = await service.getOrderList();

    // Assert
    expect(result.length, 2);
  });

  test('getOrderList_empty_noDataException', () async {
    // Arrange
    final service = ListOrderService(OrderRepositoryFake([]));

    // Act
    // Assert
    expect(() async => await service.getOrderList(),
        throwsA(isA<NoDataException>()));
  });
}
