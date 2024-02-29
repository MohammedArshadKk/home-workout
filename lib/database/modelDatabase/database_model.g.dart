// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryModelAdapter extends TypeAdapter<HistoryModel> {
  @override
  final int typeId = 1;

  @override
  HistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryModel(
      gif: fields[1] as dynamic,
      workOutName: fields[2] as String?,
      duration: fields[3] as String?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.gif)
      ..writeByte(2)
      ..write(obj.workOutName)
      ..writeByte(3)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HistoryFullbodyAdapter extends TypeAdapter<HistoryFullbody> {
  @override
  final int typeId = 2;

  @override
  HistoryFullbody read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryFullbody(
      days: fields[1] as num?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryFullbody obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryFullbodyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BMImodelAdapter extends TypeAdapter<BMImodel> {
  @override
  final int typeId = 3;

  @override
  BMImodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BMImodel(
      weight: fields[1] as String,
      height: fields[2] as String,
      bmi: fields[3] as String,
      health: fields[4] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, BMImodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.bmi)
      ..writeByte(4)
      ..write(obj.health);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BMImodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HistoryLevelsAdapter extends TypeAdapter<HistoryLevels> {
  @override
  final int typeId = 4;

  @override
  HistoryLevels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryLevels(
      levels: fields[1] as num?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryLevels obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.levels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryLevelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyRoutineModelAdapter extends TypeAdapter<DailyRoutineModel> {
  @override
  final int typeId = 5;

  @override
  DailyRoutineModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyRoutineModel(
      wakeUp: fields[1] as dynamic,
      workoutTime: fields[2] as dynamic,
      sleep: fields[3] as dynamic,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DailyRoutineModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.wakeUp)
      ..writeByte(2)
      ..write(obj.workoutTime)
      ..writeByte(3)
      ..write(obj.sleep);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyRoutineModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
