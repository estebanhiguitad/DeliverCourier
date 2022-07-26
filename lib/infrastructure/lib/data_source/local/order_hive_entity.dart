part 'order_hive_entity.g.dart';

class OrderHiveEntity {
  late String uid;

  late String startAddress;

  late String endAddress;

  late int price;

  late String description;

  late int state;

  late DateTime createdAt;

  OrderHiveEntity(
    this.uid,
    this.startAddress,
    this.endAddress,
    this.description,
    this.price,
    this.state,
    this.createdAt,
  );
}
