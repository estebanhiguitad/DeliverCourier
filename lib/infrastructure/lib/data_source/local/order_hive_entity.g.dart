// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_hive_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderHiveEntityAdapter extends TypeAdapter<OrderHiveEntity> {
  @override
  final int typeId = 0;

  @override
  OrderHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderHiveEntity(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[4] as String,
      fields[3] as int,
      fields[5] as int,
      fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OrderHiveEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.startAddress)
      ..writeByte(2)
      ..write(obj.endAddress)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
