import 'package:domain/exceptions/no_data_exception.dart';
import 'package:domain/use_cases/get_list_order.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/order_repository_fake.dart';
import '../repositories/order_repository_stub.dart';

void main() {
  test('getOrderList_success', () async {
    // Arrange
    final service = GetListOrder(OrderRepositoryStub());

    // Act
    final result = await service();

    // Assert
    expect(result.length, 2);
  });

  test('getOrderList_empty_noDataException', () async {
    // Arrange
    final service = GetListOrder(OrderRepositoryFake([]));

    // Act
    // Assert
    expect(() async => await service(), throwsA(isA<NoDataException>()));
  });
}
