// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bachelor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BachelorAdapter extends TypeAdapter<Bachelor> {
  @override
  final int typeId = 0;

  @override
  Bachelor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bachelor(
      id: fields[0] as int,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      gender: fields[3] as Gender,
      avatar: fields[4] as String,
      searchFor: (fields[5] as List).cast<Gender>(),
      job: fields[6] as String?,
      description: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Bachelor obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.avatar)
      ..writeByte(5)
      ..write(obj.searchFor)
      ..writeByte(6)
      ..write(obj.job)
      ..writeByte(7)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BachelorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenderAdapter extends TypeAdapter<Gender> {
  @override
  final int typeId = 1;

  @override
  Gender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Gender.MALE;
      case 1:
        return Gender.FEMALE;
      default:
        return Gender.MALE;
    }
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    switch (obj) {
      case Gender.MALE:
        writer.writeByte(0);
        break;
      case Gender.FEMALE:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
