// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return Patient(
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    medicalHistory:
        (json['medicalHistory'] as List)?.map((e) => e as String)?.toList(),
    symptoms: (json['symptoms'] as List)?.map((e) => e as String)?.toList(),
    countriesTravelled:
        (json['countriesTravelled'] as List)?.map((e) => e as String)?.toList(),
    height: json['height'] as int,
    weight: json['weight'] as int,
    age: json['age'] as int,
  );
}

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'gender': _$GenderEnumMap[instance.gender],
      'countriesTravelled': instance.countriesTravelled,
      'symptoms': instance.symptoms,
      'medicalHistory': instance.medicalHistory,
      'weight': instance.weight,
      'age': instance.age,
      'height': instance.height,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
