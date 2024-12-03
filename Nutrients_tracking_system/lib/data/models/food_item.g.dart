// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFoodItemCollection on Isar {
  IsarCollection<FoodItem> get foodItems => this.collection();
}

const FoodItemSchema = CollectionSchema(
  name: r'FoodItem',
  id: 8311037358550475404,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.long,
    ),
    r'carbohydrates': PropertySchema(
      id: 1,
      name: r'carbohydrates',
      type: IsarType.long,
    ),
    r'catogory': PropertySchema(
      id: 2,
      name: r'catogory',
      type: IsarType.string,
    ),
    r'fats': PropertySchema(
      id: 3,
      name: r'fats',
      type: IsarType.long,
    ),
    r'foodid': PropertySchema(
      id: 4,
      name: r'foodid',
      type: IsarType.string,
    ),
    r'foodidToInt': PropertySchema(
      id: 5,
      name: r'foodidToInt',
      type: IsarType.long,
    ),
    r'isSelected': PropertySchema(
      id: 6,
      name: r'isSelected',
      type: IsarType.bool,
    ),
    r'mealType': PropertySchema(
      id: 7,
      name: r'mealType',
      type: IsarType.byte,
      enumMap: _FoodItemmealTypeEnumValueMap,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'proteins': PropertySchema(
      id: 9,
      name: r'proteins',
      type: IsarType.long,
    ),
    r'quantity': PropertySchema(
      id: 10,
      name: r'quantity',
      type: IsarType.string,
    ),
    r'totQuantity': PropertySchema(
      id: 11,
      name: r'totQuantity',
      type: IsarType.long,
    )
  },
  estimateSize: _foodItemEstimateSize,
  serialize: _foodItemSerialize,
  deserialize: _foodItemDeserialize,
  deserializeProp: _foodItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'foodid': IndexSchema(
      id: 5461992568998985992,
      name: r'foodid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'foodid',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _foodItemGetId,
  getLinks: _foodItemGetLinks,
  attach: _foodItemAttach,
  version: '3.1.0+1',
);

int _foodItemEstimateSize(
  FoodItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.catogory.length * 3;
  bytesCount += 3 + object.foodid.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.quantity.length * 3;
  return bytesCount;
}

void _foodItemSerialize(
  FoodItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.calories);
  writer.writeLong(offsets[1], object.carbohydrates);
  writer.writeString(offsets[2], object.catogory);
  writer.writeLong(offsets[3], object.fats);
  writer.writeString(offsets[4], object.foodid);
  writer.writeLong(offsets[5], object.foodidToInt);
  writer.writeBool(offsets[6], object.isSelected);
  writer.writeByte(offsets[7], object.mealType.index);
  writer.writeString(offsets[8], object.name);
  writer.writeLong(offsets[9], object.proteins);
  writer.writeString(offsets[10], object.quantity);
  writer.writeLong(offsets[11], object.totQuantity);
}

FoodItem _foodItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodItem(
    calories: reader.readLong(offsets[0]),
    carbohydrates: reader.readLong(offsets[1]),
    catogory: reader.readString(offsets[2]),
    fats: reader.readLong(offsets[3]),
    foodid: reader.readString(offsets[4]),
    isSelected: reader.readBoolOrNull(offsets[6]) ?? false,
    mealType:
        _FoodItemmealTypeValueEnumMap[reader.readByteOrNull(offsets[7])] ??
            MealType.breakfast,
    name: reader.readString(offsets[8]),
    proteins: reader.readLong(offsets[9]),
    quantity: reader.readString(offsets[10]),
    totQuantity: reader.readLongOrNull(offsets[11]) ?? 1,
  );
  object.id = id;
  return object;
}

P _foodItemDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 7:
      return (_FoodItemmealTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          MealType.breakfast) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FoodItemmealTypeEnumValueMap = {
  'breakfast': 0,
  'lunch': 1,
  'dinner': 2,
};
const _FoodItemmealTypeValueEnumMap = {
  0: MealType.breakfast,
  1: MealType.lunch,
  2: MealType.dinner,
};

Id _foodItemGetId(FoodItem object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _foodItemGetLinks(FoodItem object) {
  return [];
}

void _foodItemAttach(IsarCollection<dynamic> col, Id id, FoodItem object) {
  object.id = id;
}

extension FoodItemQueryWhereSort on QueryBuilder<FoodItem, FoodItem, QWhere> {
  QueryBuilder<FoodItem, FoodItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhere> anyFoodid() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'foodid'),
      );
    });
  }
}

extension FoodItemQueryWhere on QueryBuilder<FoodItem, FoodItem, QWhereClause> {
  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodidEqualTo(
      String foodid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'foodid',
        value: [foodid],
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodidNotEqualTo(
      String foodid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'foodid',
              lower: [],
              upper: [foodid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'foodid',
              lower: [foodid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'foodid',
              lower: [foodid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'foodid',
              lower: [],
              upper: [foodid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodidGreaterThan(
    String foodid, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'foodid',
        lower: [foodid],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodidLessThan(
    String foodid, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'foodid',
        lower: [],
        upper: [foodid],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodidBetween(
    String lowerFoodid,
    String upperFoodid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'foodid',
        lower: [lowerFoodid],
        includeLower: includeLower,
        upper: [upperFoodid],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodidStartsWith(
      String FoodidPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'foodid',
        lower: [FoodidPrefix],
        upper: ['$FoodidPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'foodid',
        value: [''],
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterWhereClause> foodidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'foodid',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'foodid',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'foodid',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'foodid',
              upper: [''],
            ));
      }
    });
  }
}

extension FoodItemQueryFilter
    on QueryBuilder<FoodItem, FoodItem, QFilterCondition> {
  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> caloriesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> caloriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> caloriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> caloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> carbohydratesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      carbohydratesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> carbohydratesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbohydrates',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> carbohydratesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbohydrates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'catogory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'catogory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'catogory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'catogory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'catogory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'catogory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'catogory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'catogory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'catogory',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> catogoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'catogory',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fatsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fats',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fatsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fats',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fatsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fats',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> fatsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodid',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodid',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidToIntEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodidToInt',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      foodidToIntGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodidToInt',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidToIntLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodidToInt',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> foodidToIntBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodidToInt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> isSelectedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSelected',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> mealTypeEqualTo(
      MealType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealType',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> mealTypeGreaterThan(
    MealType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealType',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> mealTypeLessThan(
    MealType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealType',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> mealTypeBetween(
    MealType lower,
    MealType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> proteinsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proteins',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> proteinsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proteins',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> proteinsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proteins',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> proteinsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proteins',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quantity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> quantityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quantity',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> totQuantityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition>
      totQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> totQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterFilterCondition> totQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FoodItemQueryObject
    on QueryBuilder<FoodItem, FoodItem, QFilterCondition> {}

extension FoodItemQueryLinks
    on QueryBuilder<FoodItem, FoodItem, QFilterCondition> {}

extension FoodItemQuerySortBy on QueryBuilder<FoodItem, FoodItem, QSortBy> {
  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCatogory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catogory', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByCatogoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catogory', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fats', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fats', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFoodid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodid', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFoodidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodid', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFoodidToInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodidToInt', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByFoodidToIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodidToInt', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByMealTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByTotQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totQuantity', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> sortByTotQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totQuantity', Sort.desc);
    });
  }
}

extension FoodItemQuerySortThenBy
    on QueryBuilder<FoodItem, FoodItem, QSortThenBy> {
  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCarbohydratesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbohydrates', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCatogory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catogory', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByCatogoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catogory', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fats', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fats', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFoodid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodid', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFoodidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodid', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFoodidToInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodidToInt', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByFoodidToIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodidToInt', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByMealTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByProteinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteins', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByTotQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totQuantity', Sort.asc);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QAfterSortBy> thenByTotQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totQuantity', Sort.desc);
    });
  }
}

extension FoodItemQueryWhereDistinct
    on QueryBuilder<FoodItem, FoodItem, QDistinct> {
  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByCarbohydrates() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbohydrates');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByCatogory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'catogory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByFats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fats');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByFoodid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByFoodidToInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodidToInt');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSelected');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealType');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByProteins() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proteins');
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByQuantity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodItem, FoodItem, QDistinct> distinctByTotQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totQuantity');
    });
  }
}

extension FoodItemQueryProperty
    on QueryBuilder<FoodItem, FoodItem, QQueryProperty> {
  QueryBuilder<FoodItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodItem, int, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<FoodItem, int, QQueryOperations> carbohydratesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbohydrates');
    });
  }

  QueryBuilder<FoodItem, String, QQueryOperations> catogoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'catogory');
    });
  }

  QueryBuilder<FoodItem, int, QQueryOperations> fatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fats');
    });
  }

  QueryBuilder<FoodItem, String, QQueryOperations> foodidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodid');
    });
  }

  QueryBuilder<FoodItem, int, QQueryOperations> foodidToIntProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodidToInt');
    });
  }

  QueryBuilder<FoodItem, bool, QQueryOperations> isSelectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSelected');
    });
  }

  QueryBuilder<FoodItem, MealType, QQueryOperations> mealTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealType');
    });
  }

  QueryBuilder<FoodItem, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FoodItem, int, QQueryOperations> proteinsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proteins');
    });
  }

  QueryBuilder<FoodItem, String, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<FoodItem, int, QQueryOperations> totQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totQuantity');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) => FoodItem(
      foodid: json['foodid'] as String,
      name: json['name'] as String,
      calories: json['calories'] as int,
      proteins: json['proteins'] as int,
      carbohydrates: json['carbohydrates'] as int,
      fats: json['fats'] as int,
      catogory: json['catogory'] as String,
      quantity: json['quantity'] as String,
      totQuantity: json['totQuantity'] as int? ?? 1,
      isSelected: json['isSelected'] as bool? ?? false,
      mealType: $enumDecodeNullable(_$MealTypeEnumMap, json['mealType']) ??
          MealType.breakfast,
    )..id = json['id'] as int?;

Map<String, dynamic> _$FoodItemToJson(FoodItem instance) => <String, dynamic>{
      'id': instance.id,
      'foodid': instance.foodid,
      'name': instance.name,
      'calories': instance.calories,
      'proteins': instance.proteins,
      'carbohydrates': instance.carbohydrates,
      'fats': instance.fats,
      'catogory': instance.catogory,
      'quantity': instance.quantity,
      'mealType': _$MealTypeEnumMap[instance.mealType]!,
      'totQuantity': instance.totQuantity,
      'isSelected': instance.isSelected,
    };

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.lunch: 'lunch',
  MealType.dinner: 'dinner',
};
