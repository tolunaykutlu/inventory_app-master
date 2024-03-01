// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FasonWork {
  String? id;
  String? entryDate;
  String? firmName;
  String? quality;
  double? thickness;
  int? en;
  String? boy;
  int? kilo;
  int? adet;
  String? description;
  String? writerId;
  FasonWork({
    this.id,
    this.entryDate,
    this.firmName,
    this.quality,
    this.thickness,
    this.en,
    this.boy,
    this.kilo,
    this.adet,
    this.description,
    this.writerId,
  });

  FasonWork copyWith({
    String? id,
    String? entryDate,
    String? firmName,
    String? quality,
    double? thickness,
    int? en,
    String? boy,
    int? kilo,
    int? adet,
    String? description,
    String? writerId,
  }) {
    return FasonWork(
      id: id ?? this.id,
      entryDate: entryDate ?? this.entryDate,
      firmName: firmName ?? this.firmName,
      quality: quality ?? this.quality,
      thickness: thickness ?? this.thickness,
      en: en ?? this.en,
      boy: boy ?? this.boy,
      kilo: kilo ?? this.kilo,
      adet: adet ?? this.adet,
      description: description ?? this.description,
      writerId: writerId ?? this.writerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'entryDate': entryDate,
      'firmName': firmName,
      'quality': quality,
      'thickness': thickness,
      'en': en,
      'boy': boy,
      'kilo': kilo,
      'adet': adet,
      'description': description,
      'writerId': writerId,
    };
  }

  factory FasonWork.fromMap(Map<String, dynamic> map) {
    return FasonWork(
      id: map['id'] != null ? map['id'] as String : null,
      entryDate: map['entryDate'] != null ? map['entryDate'] as String : null,
      firmName: map['firmName'] != null ? map['firmName'] as String : null,
      quality: map['quality'] != null ? map['quality'] as String : null,
      thickness: map['thickness'] != null ? map['thickness'] as double : null,
      en: map['en'] != null ? map['en'] as int : null,
      boy: map['boy'] != null ? map['boy'] as String : null,
      kilo: map['kilo'] != null ? map['kilo'] as int : null,
      adet: map['adet'] != null ? map['adet'] as int : null,
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
    return 'FasonWork(id: $id, entryDate: $entryDate, firmName: $firmName, quality: $quality, thickness: $thickness, en: $en, boy: $boy, kilo: $kilo, adet: $adet, description: $description, writerId: $writerId)';
  }

  @override
  bool operator ==(covariant FasonWork other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.entryDate == entryDate &&
        other.firmName == firmName &&
        other.quality == quality &&
        other.thickness == thickness &&
        other.en == en &&
        other.boy == boy &&
        other.kilo == kilo &&
        other.adet == adet &&
        other.description == description &&
        other.writerId == writerId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        entryDate.hashCode ^
        firmName.hashCode ^
        quality.hashCode ^
        thickness.hashCode ^
        en.hashCode ^
        boy.hashCode ^
        kilo.hashCode ^
        adet.hashCode ^
        description.hashCode ^
        writerId.hashCode;
  }
}
