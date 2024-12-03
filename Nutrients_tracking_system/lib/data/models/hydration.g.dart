// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydration.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHydrationCollection on Isar {
  IsarCollection<Hydration> get hydrations => this.collection();
}

const HydrationSchema = CollectionSchema(
  name: r'Hydration',
  id: 1755819878101335591,
  properties: {
    r'cloudUpdatedAt': PropertySchema(
      id: 0,
      name: r'cloudUpdatedAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'localUpdatedAt': PropertySchema(
      id: 2,
      name: r'localUpdatedAt',
      type: IsarType.dateTime,
    ),
    r'log': PropertySchema(
      id: 3,
      name: r'log',
      type: IsarType.object,
      target: r'HydrationLog',
    ),
    r'target': PropertySchema(
      id: 4,
      name: r'target',
      type: IsarType.long,
    )
  },
  estimateSize: _hydrationEstimateSize,
  serialize: _hydrationSerialize,
  deserialize: _hydrationDeserialize,
  deserializeProp: _hydrationDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'HydrationLog': HydrationLogSchema},
  getId: _hydrationGetId,
  getLinks: _hydrationGetLinks,
  attach: _hydrationAttach,
  version: '3.1.0+1',
);

int _hydrationEstimateSize(
  Hydration object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      HydrationLogSchema.estimateSize(
          object.log, allOffsets[HydrationLog]!, allOffsets);
  return bytesCount;
}

void _hydrationSerialize(
  Hydration object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.cloudUpdatedAt);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeDateTime(offsets[2], object.localUpdatedAt);
  writer.writeObject<HydrationLog>(
    offsets[3],
    allOffsets,
    HydrationLogSchema.serialize,
    object.log,
  );
  writer.writeLong(offsets[4], object.target);
}

Hydration _hydrationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Hydration(
    cloudUpdatedAt: reader.readDateTimeOrNull(offsets[0]),
    date: reader.readDateTime(offsets[1]),
    localUpdatedAt: reader.readDateTime(offsets[2]),
    log: reader.readObjectOrNull<HydrationLog>(
          offsets[3],
          HydrationLogSchema.deserialize,
          allOffsets,
        ) ??
        HydrationLog(),
    target: reader.readLong(offsets[4]),
  );
  return object;
}

P _hydrationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<HydrationLog>(
            offset,
            HydrationLogSchema.deserialize,
            allOffsets,
          ) ??
          HydrationLog()) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _hydrationGetId(Hydration object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hydrationGetLinks(Hydration object) {
  return [];
}

void _hydrationAttach(IsarCollection<dynamic> col, Id id, Hydration object) {}

extension HydrationByIndex on IsarCollection<Hydration> {
  Future<Hydration?> getByDate(DateTime date) {
    return getByIndex(r'date', [date]);
  }

  Hydration? getByDateSync(DateTime date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<Hydration?>> getAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<Hydration?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(Hydration object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(Hydration object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<Hydration> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(List<Hydration> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension HydrationQueryWhereSort
    on QueryBuilder<Hydration, Hydration, QWhere> {
  QueryBuilder<Hydration, Hydration, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension HydrationQueryWhere
    on QueryBuilder<Hydration, Hydration, QWhereClause> {
  QueryBuilder<Hydration, Hydration, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhereClause> dateNotEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HydrationQueryFilter
    on QueryBuilder<Hydration, Hydration, QFilterCondition> {
  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      cloudUpdatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cloudUpdatedAt',
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      cloudUpdatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cloudUpdatedAt',
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      cloudUpdatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cloudUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      cloudUpdatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cloudUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      cloudUpdatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cloudUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      cloudUpdatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cloudUpdatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      localUpdatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      localUpdatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      localUpdatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition>
      localUpdatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localUpdatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> targetEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'target',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> targetGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'target',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> targetLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'target',
        value: value,
      ));
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> targetBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'target',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HydrationQueryObject
    on QueryBuilder<Hydration, Hydration, QFilterCondition> {
  QueryBuilder<Hydration, Hydration, QAfterFilterCondition> log(
      FilterQuery<HydrationLog> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'log');
    });
  }
}

extension HydrationQueryLinks
    on QueryBuilder<Hydration, Hydration, QFilterCondition> {}

extension HydrationQuerySortBy on QueryBuilder<Hydration, Hydration, QSortBy> {
  QueryBuilder<Hydration, Hydration, QAfterSortBy> sortByCloudUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> sortByCloudUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> sortByLocalUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> sortByLocalUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> sortByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.asc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> sortByTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.desc);
    });
  }
}

extension HydrationQuerySortThenBy
    on QueryBuilder<Hydration, Hydration, QSortThenBy> {
  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenByCloudUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenByCloudUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenByLocalUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenByLocalUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.asc);
    });
  }

  QueryBuilder<Hydration, Hydration, QAfterSortBy> thenByTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.desc);
    });
  }
}

extension HydrationQueryWhereDistinct
    on QueryBuilder<Hydration, Hydration, QDistinct> {
  QueryBuilder<Hydration, Hydration, QDistinct> distinctByCloudUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudUpdatedAt');
    });
  }

  QueryBuilder<Hydration, Hydration, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Hydration, Hydration, QDistinct> distinctByLocalUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localUpdatedAt');
    });
  }

  QueryBuilder<Hydration, Hydration, QDistinct> distinctByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'target');
    });
  }
}

extension HydrationQueryProperty
    on QueryBuilder<Hydration, Hydration, QQueryProperty> {
  QueryBuilder<Hydration, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Hydration, DateTime?, QQueryOperations>
      cloudUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudUpdatedAt');
    });
  }

  QueryBuilder<Hydration, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Hydration, DateTime, QQueryOperations> localUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localUpdatedAt');
    });
  }

  QueryBuilder<Hydration, HydrationLog, QQueryOperations> logProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'log');
    });
  }

  QueryBuilder<Hydration, int, QQueryOperations> targetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'target');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HydrationLogSchema = Schema(
  name: r'HydrationLog',
  id: -7958142729933690373,
  properties: {
    r'aft': PropertySchema(
      id: 0,
      name: r'aft',
      type: IsarType.long,
    ),
    r'eve': PropertySchema(
      id: 1,
      name: r'eve',
      type: IsarType.long,
    ),
    r'mor': PropertySchema(
      id: 2,
      name: r'mor',
      type: IsarType.long,
    ),
    r'nig': PropertySchema(
      id: 3,
      name: r'nig',
      type: IsarType.long,
    )
  },
  estimateSize: _hydrationLogEstimateSize,
  serialize: _hydrationLogSerialize,
  deserialize: _hydrationLogDeserialize,
  deserializeProp: _hydrationLogDeserializeProp,
);

int _hydrationLogEstimateSize(
  HydrationLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _hydrationLogSerialize(
  HydrationLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.aft);
  writer.writeLong(offsets[1], object.eve);
  writer.writeLong(offsets[2], object.mor);
  writer.writeLong(offsets[3], object.nig);
}

HydrationLog _hydrationLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HydrationLog(
    aft: reader.readLong(offsets[0]),
    eve: reader.readLong(offsets[1]),
    mor: reader.readLong(offsets[2]),
    nig: reader.readLong(offsets[3]),
  );
  return object;
}

P _hydrationLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension HydrationLogQueryFilter
    on QueryBuilder<HydrationLog, HydrationLog, QFilterCondition> {
  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> aftEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aft',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition>
      aftGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aft',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> aftLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aft',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> aftBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aft',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> eveEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eve',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition>
      eveGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eve',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> eveLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eve',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> eveBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eve',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> morEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mor',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition>
      morGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mor',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> morLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mor',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> morBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> nigEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nig',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition>
      nigGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nig',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> nigLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nig',
        value: value,
      ));
    });
  }

  QueryBuilder<HydrationLog, HydrationLog, QAfterFilterCondition> nigBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nig',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HydrationLogQueryObject
    on QueryBuilder<HydrationLog, HydrationLog, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HydrationImpl _$$HydrationImplFromJson(Map<String, dynamic> json) =>
    _$HydrationImpl(
      date: DateTime.parse(json['date'] as String),
      target: _stringToInt(json['target'] as String),
      cloudUpdatedAt: json['updationTime'] == null
          ? null
          : DateTime.parse(json['updationTime'] as String),
      localUpdatedAt: DateTime.parse(json['localUpdatedAt'] as String),
      log: json['log'] == null
          ? const HydrationLog()
          : HydrationLog.fromJson(json['log'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HydrationImplToJson(_$HydrationImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'target': _intToString(instance.target),
      'updationTime': instance.cloudUpdatedAt?.toIso8601String(),
      'log': instance.log.toJson(),
    };

_$HydrationLogImpl _$$HydrationLogImplFromJson(Map<String, dynamic> json) =>
    _$HydrationLogImpl(
      mor: json['mor'] == null ? 0 : _stringToInt(json['mor'] as String),
      aft: json['aft'] == null ? 0 : _stringToInt(json['aft'] as String),
      eve: json['eve'] == null ? 0 : _stringToInt(json['eve'] as String),
      nig: json['nig'] == null ? 0 : _stringToInt(json['nig'] as String),
    );

Map<String, dynamic> _$$HydrationLogImplToJson(_$HydrationLogImpl instance) =>
    <String, dynamic>{
      'mor': _intToString(instance.mor),
      'aft': _intToString(instance.aft),
      'eve': _intToString(instance.eve),
      'nig': _intToString(instance.nig),
    };
