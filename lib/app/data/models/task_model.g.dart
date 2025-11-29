// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      idHive: fields[0] as int,
      titleHive: fields[1] as String,
      messageHive: fields[2] as String,
      statusHive: fields[3] as String,
      createdAtHive: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.idHive)
      ..writeByte(1)
      ..write(obj.titleHive)
      ..writeByte(2)
      ..write(obj.messageHive)
      ..writeByte(3)
      ..write(obj.statusHive)
      ..writeByte(4)
      ..write(obj.createdAtHive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
