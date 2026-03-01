// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RunAdapter extends TypeAdapter<Run> {
  @override
  final int typeId = 1;

  @override
  Run read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Run()
      ..timeSec = fields[0] as int
      ..distance = fields[1] as double
      ..avgSecondsPerKm = fields[2] as int
      ..avgCadence = fields[3] as int
      ..calories = fields[4] as int
      ..heartRate = fields[5] as int
      ..temp = fields[6] as int;
  }

  @override
  void write(BinaryWriter writer, Run obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.timeSec)
      ..writeByte(1)
      ..write(obj.distance)
      ..writeByte(2)
      ..write(obj.avgSecondsPerKm)
      ..writeByte(3)
      ..write(obj.avgCadence)
      ..writeByte(4)
      ..write(obj.calories)
      ..writeByte(5)
      ..write(obj.heartRate)
      ..writeByte(6)
      ..write(obj.temp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RunAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
