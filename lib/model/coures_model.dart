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
      type: map['type']?.toString(),
      state: map['state']?.toString(),
      duration: map['duration']?.toString(),
      courseLevelField: map['courseLevelField'] != null
          ? map['courseLevelField'].toString()
          : (map['course_level_field']?.toString()),
      nameIntl: map['nameIntl'] != null
          ? map['nameIntl'].toString()
          : (map['name_intl']?.toString()),
      date: map['date']?.toString(),
      content: map['content']?.toString(),
      description: map['description']?.toString(),
      dateTime: map['dateTime'] != null
          ? (map['dateTime'] is String
                ? DateTime.tryParse(map['dateTime'])
                : DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int))
          : (map['date_time'] != null
                ? (map['date_time'] is String
                      ? DateTime.tryParse(map['date_time'])
                      : DateTime.fromMillisecondsSinceEpoch(
                          map['date_time'] as int,
                        ))
                : null),
      checkBox1: map['checkBox1'] != null
          ? (map['checkBox1'] is bool
                ? map['checkBox1'] as bool
                : (map['checkBox1'] == 1 ||
                      map['checkBox1'] == '1' ||
                      map['checkBox1'] == true))
          : (map['check_box1'] != null
                ? (map['check_box1'] is bool
                      ? map['check_box1'] as bool
                      : (map['check_box1'] == 1 ||
                            map['check_box1'] == '1' ||
                            map['check_box1'] == true))
                : null),
      byDegree: map['byDegree'] != null
          ? (map['byDegree'] is bool
                ? map['byDegree'] as bool
                : (map['byDegree'] == 1 ||
                      map['byDegree'] == '1' ||
                      map['byDegree'] == true))
          : (map['by_degree'] != null
                ? (map['by_degree'] is bool
                      ? map['by_degree'] as bool
                      : (map['by_degree'] == 1 ||
                            map['by_degree'] == '1' ||
                            map['by_degree'] == true))
                : null),
      byCartificate: map['byCartificate'] != null
          ? (map['byCartificate'] is bool
                ? map['byCartificate'] as bool
                : (map['byCartificate'] == 1 ||
                      map['byCartificate'] == '1' ||
                      map['byCartificate'] == true))
          : (map['by_cartificate'] != null
                ? (map['by_cartificate'] is bool
                      ? map['by_cartificate'] as bool
                      : (map['by_cartificate'] == 1 ||
                            map['by_cartificate'] == '1' ||
                            map['by_cartificate'] == true))
                : null),
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
