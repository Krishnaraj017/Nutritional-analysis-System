// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_app_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalAppInfoAdapter extends TypeAdapter<LocalAppInfo> {
  @override
  final int typeId = 1;

  @override
  LocalAppInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalAppInfo(
      hisVisited: fields[0] == null ? false : fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LocalAppInfo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.hisVisited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalAppInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
