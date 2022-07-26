import 'package:hive/hive.dart';

part 'order_hive_entity.g.dart';

@HiveType(typeId: 0)
class OrderHiveEntity extends HiveObject {
  @HiveField(0)
  late String uid;

  @HiveField(1)
  late String startAddress;

  @HiveField(2)
  late String endAddress;

  @HiveField(3)
  late int price;

  @HiveField(4)
  late String description;

  @HiveField(5)
  late int state;

  @HiveField(6)
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
