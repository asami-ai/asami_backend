/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user.dart' as _i2;

abstract class Address
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Address._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.label,
    required this.recipientName,
    required this.phoneNumber,
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    this.landmark,
    bool? isDefault,
    bool? isActive,
    this.latitude,
    this.longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        isDefault = isDefault ?? false,
        isActive = isActive ?? true,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Address({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String label,
    required String recipientName,
    required String phoneNumber,
    required String addressLine1,
    String? addressLine2,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    String? landmark,
    bool? isDefault,
    bool? isActive,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AddressImpl;

  factory Address.fromJson(Map<String, dynamic> jsonSerialization) {
    return Address(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      label: jsonSerialization['label'] as String,
      recipientName: jsonSerialization['recipientName'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      addressLine1: jsonSerialization['addressLine1'] as String,
      addressLine2: jsonSerialization['addressLine2'] as String?,
      city: jsonSerialization['city'] as String,
      state: jsonSerialization['state'] as String,
      country: jsonSerialization['country'] as String,
      postalCode: jsonSerialization['postalCode'] as String,
      landmark: jsonSerialization['landmark'] as String?,
      isDefault: jsonSerialization['isDefault'] as bool,
      isActive: jsonSerialization['isActive'] as bool,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = AddressTable();

  static const db = AddressRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  String label;

  String recipientName;

  String phoneNumber;

  String addressLine1;

  String? addressLine2;

  String city;

  String state;

  String country;

  String postalCode;

  String? landmark;

  bool isDefault;

  bool isActive;

  double? latitude;

  double? longitude;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Address]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Address copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? label,
    String? recipientName,
    String? phoneNumber,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    String? landmark,
    bool? isDefault,
    bool? isActive,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'label': label,
      'recipientName': recipientName,
      'phoneNumber': phoneNumber,
      'addressLine1': addressLine1,
      if (addressLine2 != null) 'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      if (landmark != null) 'landmark': landmark,
      'isDefault': isDefault,
      'isActive': isActive,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'label': label,
      'recipientName': recipientName,
      'phoneNumber': phoneNumber,
      'addressLine1': addressLine1,
      if (addressLine2 != null) 'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      if (landmark != null) 'landmark': landmark,
      'isDefault': isDefault,
      'isActive': isActive,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static AddressInclude include({_i2.UserInclude? user}) {
    return AddressInclude._(user: user);
  }

  static AddressIncludeList includeList({
    _i1.WhereExpressionBuilder<AddressTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AddressTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AddressTable>? orderByList,
    AddressInclude? include,
  }) {
    return AddressIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Address.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Address.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AddressImpl extends Address {
  _AddressImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String label,
    required String recipientName,
    required String phoneNumber,
    required String addressLine1,
    String? addressLine2,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    String? landmark,
    bool? isDefault,
    bool? isActive,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          label: label,
          recipientName: recipientName,
          phoneNumber: phoneNumber,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          city: city,
          state: state,
          country: country,
          postalCode: postalCode,
          landmark: landmark,
          isDefault: isDefault,
          isActive: isActive,
          latitude: latitude,
          longitude: longitude,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Address]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Address copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? label,
    String? recipientName,
    String? phoneNumber,
    String? addressLine1,
    Object? addressLine2 = _Undefined,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    Object? landmark = _Undefined,
    bool? isDefault,
    bool? isActive,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Address(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      label: label ?? this.label,
      recipientName: recipientName ?? this.recipientName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 is String? ? addressLine2 : this.addressLine2,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
      landmark: landmark is String? ? landmark : this.landmark,
      isDefault: isDefault ?? this.isDefault,
      isActive: isActive ?? this.isActive,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class AddressTable extends _i1.Table<_i1.UuidValue> {
  AddressTable({super.tableRelation}) : super(tableName: 'addresses') {
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    label = _i1.ColumnString(
      'label',
      this,
    );
    recipientName = _i1.ColumnString(
      'recipientName',
      this,
    );
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    addressLine1 = _i1.ColumnString(
      'addressLine1',
      this,
    );
    addressLine2 = _i1.ColumnString(
      'addressLine2',
      this,
    );
    city = _i1.ColumnString(
      'city',
      this,
    );
    state = _i1.ColumnString(
      'state',
      this,
    );
    country = _i1.ColumnString(
      'country',
      this,
    );
    postalCode = _i1.ColumnString(
      'postalCode',
      this,
    );
    landmark = _i1.ColumnString(
      'landmark',
      this,
    );
    isDefault = _i1.ColumnBool(
      'isDefault',
      this,
      hasDefault: true,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnUuid userId;

  _i2.UserTable? _user;

  late final _i1.ColumnString label;

  late final _i1.ColumnString recipientName;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnString addressLine1;

  late final _i1.ColumnString addressLine2;

  late final _i1.ColumnString city;

  late final _i1.ColumnString state;

  late final _i1.ColumnString country;

  late final _i1.ColumnString postalCode;

  late final _i1.ColumnString landmark;

  late final _i1.ColumnBool isDefault;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Address.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        label,
        recipientName,
        phoneNumber,
        addressLine1,
        addressLine2,
        city,
        state,
        country,
        postalCode,
        landmark,
        isDefault,
        isActive,
        latitude,
        longitude,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class AddressInclude extends _i1.IncludeObject {
  AddressInclude._({_i2.UserInclude? user}) {
    _user = user;
  }

  _i2.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<_i1.UuidValue> get table => Address.t;
}

class AddressIncludeList extends _i1.IncludeList {
  AddressIncludeList._({
    _i1.WhereExpressionBuilder<AddressTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Address.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Address.t;
}

class AddressRepository {
  const AddressRepository._();

  final attachRow = const AddressAttachRowRepository._();

  /// Returns a list of [Address]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Address>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AddressTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AddressTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AddressTable>? orderByList,
    _i1.Transaction? transaction,
    AddressInclude? include,
  }) async {
    return session.db.find<Address>(
      where: where?.call(Address.t),
      orderBy: orderBy?.call(Address.t),
      orderByList: orderByList?.call(Address.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Address] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Address?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AddressTable>? where,
    int? offset,
    _i1.OrderByBuilder<AddressTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AddressTable>? orderByList,
    _i1.Transaction? transaction,
    AddressInclude? include,
  }) async {
    return session.db.findFirstRow<Address>(
      where: where?.call(Address.t),
      orderBy: orderBy?.call(Address.t),
      orderByList: orderByList?.call(Address.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Address] by its [id] or null if no such row exists.
  Future<Address?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    AddressInclude? include,
  }) async {
    return session.db.findById<Address>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Address]s in the list and returns the inserted rows.
  ///
  /// The returned [Address]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Address>> insert(
    _i1.Session session,
    List<Address> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Address>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Address] and returns the inserted row.
  ///
  /// The returned [Address] will have its `id` field set.
  Future<Address> insertRow(
    _i1.Session session,
    Address row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Address>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Address]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Address>> update(
    _i1.Session session,
    List<Address> rows, {
    _i1.ColumnSelections<AddressTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Address>(
      rows,
      columns: columns?.call(Address.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Address]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Address> updateRow(
    _i1.Session session,
    Address row, {
    _i1.ColumnSelections<AddressTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Address>(
      row,
      columns: columns?.call(Address.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Address]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Address>> delete(
    _i1.Session session,
    List<Address> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Address>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Address].
  Future<Address> deleteRow(
    _i1.Session session,
    Address row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Address>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Address>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AddressTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Address>(
      where: where(Address.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AddressTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Address>(
      where: where?.call(Address.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AddressAttachRowRepository {
  const AddressAttachRowRepository._();

  /// Creates a relation between the given [Address] and [User]
  /// by setting the [Address]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    Address address,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (address.id == null) {
      throw ArgumentError.notNull('address.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $address = address.copyWith(userId: user.id);
    await session.db.updateRow<Address>(
      $address,
      columns: [Address.t.userId],
      transaction: transaction,
    );
  }
}
