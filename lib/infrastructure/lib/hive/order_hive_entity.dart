import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class OrderHiveEntity extends HiveObject {
  @HiveField(0)
  late String startAddress;

  @HiveField(1)
  late String endAddress;

  @HiveField(2)
  late int price;

  @HiveField(3)
  late String description;

  @HiveField(3)
  late int state;

  OrderHiveEntity(
    this.startAddress,
    this.endAddress,
    this.description,
    this.price,
    this.state,
  );
}
