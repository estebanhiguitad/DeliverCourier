// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'objectbox/customer_entity.dart';
import 'objectbox/delivery_couriers_entity.dart';
import 'objectbox/order_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 2459299831449568846),
      name: 'CustomerEntity',
      lastPropertyId: const IdUid(2, 4411371680718577725),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7366928288749791050),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4411371680718577725),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 4039444011416779869),
            name: 'order',
            targetId: const IdUid(4, 8509845063059958369))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 5736264567342123544),
      name: 'DeliveryCouriers',
      lastPropertyId: const IdUid(2, 1732661641900783800),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1543859281863126272),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1732661641900783800),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(2, 4090942074330875531),
            name: 'orders',
            targetId: const IdUid(4, 8509845063059958369))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 8509845063059958369),
      name: 'OrderEntity',
      lastPropertyId: const IdUid(8, 4912518275061071388),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2103203214249846365),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 390881710027923563),
            name: 'startAddress',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3533317461308422212),
            name: 'endAddress',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7979916875489528101),
            name: 'price',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4655419105918647828),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2616403046684079461),
            name: 'customerId',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 5106459772322286196),
            relationTarget: 'CustomerEntity'),
        ModelProperty(
            id: const IdUid(7, 6937175711201711329),
            name: 'deliveryCourierId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 7884648788057106578),
            relationTarget: 'DeliveryCouriers'),
        ModelProperty(
            id: const IdUid(8, 4912518275061071388),
            name: 'dbStatus',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(4, 8509845063059958369),
      lastIndexId: const IdUid(4, 7884648788057106578),
      lastRelationId: const IdUid(2, 4090942074330875531),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [1123093398655243550],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        1463921914389709255,
        5994583957250993425,
        7406251804769499289,
        2453092933585544297,
        1302166977752571107,
        5337518520694797369,
        5695452435750763817,
        3796933737966857893,
        4188407943025035100
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    CustomerEntity: EntityDefinition<CustomerEntity>(
        model: _entities[0],
        toOneRelations: (CustomerEntity object) => [],
        toManyRelations: (CustomerEntity object) =>
            {RelInfo<CustomerEntity>.toMany(1, object.id): object.order},
        getId: (CustomerEntity object) => object.id,
        setId: (CustomerEntity object, int id) {
          object.id = id;
        },
        objectToFB: (CustomerEntity object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = CustomerEntity(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(
              object.order,
              store,
              RelInfo<CustomerEntity>.toMany(1, object.id),
              store.box<CustomerEntity>());
          return object;
        }),
    DeliveryCouriers: EntityDefinition<DeliveryCouriers>(
        model: _entities[1],
        toOneRelations: (DeliveryCouriers object) => [],
        toManyRelations: (DeliveryCouriers object) =>
            {RelInfo<DeliveryCouriers>.toMany(2, object.id): object.orders},
        getId: (DeliveryCouriers object) => object.id,
        setId: (DeliveryCouriers object, int id) {
          object.id = id;
        },
        objectToFB: (DeliveryCouriers object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DeliveryCouriers(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(
              object.orders,
              store,
              RelInfo<DeliveryCouriers>.toMany(2, object.id),
              store.box<DeliveryCouriers>());
          return object;
        }),
    OrderEntity: EntityDefinition<OrderEntity>(
        model: _entities[2],
        toOneRelations: (OrderEntity object) =>
            [object.customer, object.deliveryCourier],
        toManyRelations: (OrderEntity object) => {},
        getId: (OrderEntity object) => object.id,
        setId: (OrderEntity object, int id) {
          object.id = id;
        },
        objectToFB: (OrderEntity object, fb.Builder fbb) {
          final startAddressOffset = fbb.writeString(object.startAddress);
          final endAddressOffset = fbb.writeString(object.endAddress);
          final descriptionOffset = fbb.writeString(object.description);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, startAddressOffset);
          fbb.addOffset(2, endAddressOffset);
          fbb.addInt64(3, object.price);
          fbb.addOffset(4, descriptionOffset);
          fbb.addInt64(5, object.customer.targetId);
          fbb.addInt64(6, object.deliveryCourier.targetId);
          fbb.addInt64(7, object.dbStatus);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = OrderEntity(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..dbStatus = const fb.Int64Reader()
                .vTableGetNullable(buffer, rootOffset, 18);
          object.customer.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.customer.attach(store);
          object.deliveryCourier.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.deliveryCourier.attach(store);
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [CustomerEntity] entity fields to define ObjectBox queries.
class CustomerEntity_ {
  /// see [CustomerEntity.id]
  static final id =
      QueryIntegerProperty<CustomerEntity>(_entities[0].properties[0]);

  /// see [CustomerEntity.name]
  static final name =
      QueryStringProperty<CustomerEntity>(_entities[0].properties[1]);

  /// see [CustomerEntity.order]
  static final order = QueryRelationToMany<CustomerEntity, OrderEntity>(
      _entities[0].relations[0]);
}

/// [DeliveryCouriers] entity fields to define ObjectBox queries.
class DeliveryCouriers_ {
  /// see [DeliveryCouriers.id]
  static final id =
      QueryIntegerProperty<DeliveryCouriers>(_entities[1].properties[0]);

  /// see [DeliveryCouriers.name]
  static final name =
      QueryStringProperty<DeliveryCouriers>(_entities[1].properties[1]);

  /// see [DeliveryCouriers.orders]
  static final orders = QueryRelationToMany<DeliveryCouriers, OrderEntity>(
      _entities[1].relations[0]);
}

/// [OrderEntity] entity fields to define ObjectBox queries.
class OrderEntity_ {
  /// see [OrderEntity.id]
  static final id =
      QueryIntegerProperty<OrderEntity>(_entities[2].properties[0]);

  /// see [OrderEntity.startAddress]
  static final startAddress =
      QueryStringProperty<OrderEntity>(_entities[2].properties[1]);

  /// see [OrderEntity.endAddress]
  static final endAddress =
      QueryStringProperty<OrderEntity>(_entities[2].properties[2]);

  /// see [OrderEntity.price]
  static final price =
      QueryIntegerProperty<OrderEntity>(_entities[2].properties[3]);

  /// see [OrderEntity.description]
  static final description =
      QueryStringProperty<OrderEntity>(_entities[2].properties[4]);

  /// see [OrderEntity.customer]
  static final customer = QueryRelationToOne<OrderEntity, CustomerEntity>(
      _entities[2].properties[5]);

  /// see [OrderEntity.deliveryCourier]
  static final deliveryCourier =
      QueryRelationToOne<OrderEntity, DeliveryCouriers>(
          _entities[2].properties[6]);

  /// see [OrderEntity.dbStatus]
  static final dbStatus =
      QueryIntegerProperty<OrderEntity>(_entities[2].properties[7]);
}
