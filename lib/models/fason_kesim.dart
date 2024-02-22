import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FasonWork {
  String? date;
  String? firmName;
  String? pQuality;
  int? pThickness;
  int? en;
  int? boy;
  int? kilo;
  String? description;
  FasonWork({
    this.date,
    this.firmName,
    this.pQuality,
    this.pThickness,
    this.en,
    this.boy,
    this.kilo,
    this.description,
  });

  FasonWork copyWith({
    String? date,
    String? firmName,
    String? pQuality,
    int? pThickness,
    int? en,
    int? boy,
    int? kilo,
    String? description,
  }) {
    return FasonWork(
      date: date ?? this.date,
      firmName: firmName ?? this.firmName,
      pQuality: pQuality ?? this.pQuality,
      pThickness: pThickness ?? this.pThickness,
      en: en ?? this.en,
      boy: boy ?? this.boy,
      kilo: kilo ?? this.kilo,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'firmName': firmName,
      'pQuality': pQuality,
      'pThickness': pThickness,
      'en': en,
      'boy': boy,
      'kilo': kilo,
      'description': description,
    };
  }

  factory FasonWork.fromMap(Map<String, dynamic> map) {
    return FasonWork(
      date: map['date'] != null ? map['date'] as String : null,
      firmName: map['firmName'] != null ? map['firmName'] as String : null,
      pQuality: map['pQuality'] != null ? map['pQuality'] as String : null,
      pThickness: map['pThickness'] != null ? map['pThickness'] as int : null,
      en: map['en'] != null ? map['en'] as int : null,
      boy: map['boy'] != null ? map['boy'] as int : null,
      kilo: map['kilo'] != null ? map['kilo'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FasonWork.fromJson(String source) =>
      FasonWork.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FasonWork(date: $date, firmName: $firmName, pQuality: $pQuality, pThickness: $pThickness, en: $en, boy: $boy, kilo: $kilo, description: $description)';
  }

  @override
  bool operator ==(covariant FasonWork other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.firmName == firmName &&
        other.pQuality == pQuality &&
        other.pThickness == pThickness &&
        other.en == en &&
        other.boy == boy &&
        other.kilo == kilo &&
        other.description == description;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        firmName.hashCode ^
        pQuality.hashCode ^
        pThickness.hashCode ^
        en.hashCode ^
        boy.hashCode ^
        kilo.hashCode ^
        description.hashCode;
  }
}
