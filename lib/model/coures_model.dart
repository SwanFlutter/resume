import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CouresModel {
  final String? type;
  final String? state;
  final String? duration;
  final String? courseLevelField;
  final String? nameIntl;
  final String? date;
  final String? content;
  final String? description;
  final DateTime? dateTime;
  final bool? checkBox1;
  final bool? byDegree;
  final bool? byCartificate;
  CouresModel({
    this.type,
    this.state,
    this.duration,
    this.courseLevelField,
    this.nameIntl,
    this.date,
    this.content,
    this.description,
    this.dateTime,
    this.checkBox1,
    this.byDegree,
    this.byCartificate,
  });

  CouresModel copyWith({
    String? type,
    String? state,
    String? duration,
    String? courseLevelField,
    String? nameIntl,
    String? date,
    String? content,
    String? description,
    DateTime? dateTime,
    bool? checkBox1,
    bool? byDegree,
    bool? byCartificate,
  }) {
    return CouresModel(
      type: type ?? this.type,
      state: state ?? this.state,
      duration: duration ?? this.duration,
      courseLevelField: courseLevelField ?? this.courseLevelField,
      nameIntl: nameIntl ?? this.nameIntl,
      date: date ?? this.date,
      content: content ?? this.content,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      checkBox1: checkBox1 ?? this.checkBox1,
      byDegree: byDegree ?? this.byDegree,
      byCartificate: byCartificate ?? this.byCartificate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'state': state,
      'duration': duration,
      'courseLevelField': courseLevelField,
      'nameIntl': nameIntl,
      'date': date,
      'content': content,
      'description': description,
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'checkBox1': checkBox1,
      'byDegree': byDegree,
      'byCartificate': byCartificate,
    };
  }

  factory CouresModel.fromMap(Map<String, dynamic> map) {
    return CouresModel(
      type: map['type'] != null ? map['type'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      courseLevelField: map['courseLevelField'] != null
          ? map['courseLevelField'] as String
          : null,
      nameIntl: map['nameIntl'] != null ? map['nameIntl'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      dateTime: map['dateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int)
          : null,
      checkBox1: map['checkBox1'] != null ? map['checkBox1'] as bool : null,
      byDegree: map['byDegree'] != null ? map['byDegree'] as bool : null,
      byCartificate: map['byCartificate'] != null
          ? map['byCartificate'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CouresModel.fromJson(String source) =>
      CouresModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CouresModel(type: $type, state: $state, duration: $duration, courseLevelField: $courseLevelField, nameIntl: $nameIntl, date: $date, content: $content, description: $description, dateTime: $dateTime, checkBox1: $checkBox1, byDegree: $byDegree, byCartificate: $byCartificate)';
  }

  @override
  bool operator ==(covariant CouresModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.state == state &&
        other.duration == duration &&
        other.courseLevelField == courseLevelField &&
        other.nameIntl == nameIntl &&
        other.date == date &&
        other.content == content &&
        other.description == description &&
        other.dateTime == dateTime &&
        other.checkBox1 == checkBox1 &&
        other.byDegree == byDegree &&
        other.byCartificate == byCartificate;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        state.hashCode ^
        duration.hashCode ^
        courseLevelField.hashCode ^
        nameIntl.hashCode ^
        date.hashCode ^
        content.hashCode ^
        description.hashCode ^
        dateTime.hashCode ^
        checkBox1.hashCode ^
        byDegree.hashCode ^
        byCartificate.hashCode;
  }
}
