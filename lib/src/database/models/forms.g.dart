// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forms.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormsAdapter extends TypeAdapter<Forms> {
  @override
  final int typeId = 1;

  @override
  Forms read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Forms()
      ..id = fields[0] as String
      ..tiemstamp = fields[1] as String
      ..planta = fields[2] == null ? '' : fields[2] as String
      ..puesto = fields[3] == null ? '' : fields[3] as String
      ..nombre = fields[4] == null ? '' : fields[4] as String
      ..app = fields[5] == null ? '' : fields[5] as String
      ..apm = fields[6] == null ? '' : fields[6] as String
      ..edad = fields[7] as int
      ..domicilio = fields[8] == null ? '' : fields[8] as String
      ..vivecon = fields[9] == null ? '' : fields[9] as String
      ..tienehijos = fields[10] == null ? false : fields[10] as bool
      ..numhijos = fields[11] == null ? 0 : fields[11] as int;
  }

  @override
  void write(BinaryWriter writer, Forms obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.tiemstamp)
      ..writeByte(2)
      ..write(obj.planta)
      ..writeByte(3)
      ..write(obj.puesto)
      ..writeByte(4)
      ..write(obj.nombre)
      ..writeByte(5)
      ..write(obj.app)
      ..writeByte(6)
      ..write(obj.apm)
      ..writeByte(7)
      ..write(obj.edad)
      ..writeByte(8)
      ..write(obj.domicilio)
      ..writeByte(9)
      ..write(obj.vivecon)
      ..writeByte(10)
      ..write(obj.tienehijos)
      ..writeByte(11)
      ..write(obj.numhijos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
