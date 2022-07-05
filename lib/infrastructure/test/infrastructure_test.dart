import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/objectbox/customer_entity.dart';
import 'package:objectbox/objectbox.dart';

import 'object_box_env/test_env.dart';

void main() {
  late TestEnv env;
  late Store store;

  setUp(() {
    env = TestEnv('box');
    store = env.store;
  });

  tearDown(() => {env.closeAndDelete()});

  test('adds one to input values', () {
    final box = store.box<CustomerEntity>();
    final customer = env.box<CustomerEntity>().put(CustomerEntity('Esteban'));
    var result = box.get(customer)!.name;
    expect(result, "Esteban");
  });
}
