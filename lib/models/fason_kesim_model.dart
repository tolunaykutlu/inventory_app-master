// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FasonWork {
  String? id;
  String? date;
  String? firmName;
  String? pQuality;
  double? pThickness;
  int? en;
  String? boy;
  int? kilo;
  String? description;
  String? writerId;
  FasonWork({
    this.id,
    this.date,
    this.firmName,
    this.pQuality,
    this.pThickness,
    this.en,
    this.boy,
    this.kilo,
    this.description,
    this.writerId,
  });

  FasonWork copyWith({
    String? id,
    String? date,
    String? firmName,
    String? pQuality,
    double? pThickness,
    int? en,
    String? boy,
    int? kilo,
    String? description,
    String? writerId,
  }) {
    return FasonWork(
      id: id ?? this.id,
      date: date ?? this.date,
      firmName: firmName ?? this.firmName,
      pQuality: pQuality ?? this.pQuality,
      pThickness: pThickness ?? this.pThickness,
      en: en ?? this.en,
      boy: boy ?? this.boy,
      kilo: kilo ?? this.kilo,
      description: description ?? this.description,
      writerId: writerId ?? this.writerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'firmName': firmName,
      'pQuality': pQuality,
      'pThickness': pThickness,
      'en': en,
      'boy': boy,
      'kilo': kilo,
      'description': description,
      'writerId': writerId,
    };
  }

  factory FasonWork.fromMap(Map<String, dynamic> map) {
    return FasonWork(
      id: map['id'] != null ? map['id'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      firmName: map['firmName'] != null ? map['firmName'] as String : null,
      pQuality: map['pQuality'] != null ? map['pQuality'] as String : null,
      pThickness:
          map['pThickness'] != null ? map['pThickness'] as double : null,
      en: map['en'] != null ? map['en'] as int : null,
      boy: map['boy'] != null ? map['boy'] as String : null,
      kilo: map['kilo'] != null ? map['kilo'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      writerId: map['writerId'] != null ? map['writerId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FasonWork.fromJson(String source) =>
      FasonWork.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FasonWork(id: $id, date: $date, firmName: $firmName, pQuality: $pQuality, pThickness: $pThickness, en: $en, boy: $boy, kilo: $kilo, description: $description, writerId: $writerId)';
  }

  @override
  bool operator ==(covariant FasonWork other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.firmName == firmName &&
        other.pQuality == pQuality &&
        other.pThickness == pThickness &&
        other.en == en &&
        other.boy == boy &&
        other.kilo == kilo &&
        other.description == description &&
        other.writerId == writerId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        firmName.hashCode ^
        pQuality.hashCode ^
        pThickness.hashCode ^
        en.hashCode ^
        boy.hashCode ^
        kilo.hashCode ^
        description.hashCode ^
        writerId.hashCode;
  }
}
