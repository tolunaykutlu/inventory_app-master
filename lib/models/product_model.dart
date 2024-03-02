// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String? id;
  String? entryDate;
  String? quality;
  double? thickness;
  int? en;
  String? boy;
  String? kilo;
  String? fiyat;
  bool? hasPvc;
  int? adet;
  ProductModel({
    this.id,
    this.entryDate,
    this.quality,
    this.thickness,
    this.en,
    this.boy,
    this.kilo,
    this.fiyat,
    this.hasPvc,
    this.adet,
  });

  ProductModel copyWith({
    String? id,
    String? entryDate,
    String? quality,
    double? thickness,
    int? en,
    String? boy,
    String? kilo,
    String? fiyat,
    bool? hasPvc,
    int? adet,
  }) {
    return ProductModel(
      id: id ?? this.id,
      entryDate: entryDate ?? this.entryDate,
      quality: quality ?? this.quality,
      thickness: thickness ?? this.thickness,
      en: en ?? this.en,
      boy: boy ?? this.boy,
      kilo: kilo ?? this.kilo,
      fiyat: fiyat ?? this.fiyat,
      hasPvc: hasPvc ?? this.hasPvc,
      adet: adet ?? this.adet,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'entryDate': entryDate,
      'quality': quality,
      'thickness': thickness,
      'en': en,
      'boy': boy,
      'kilo': kilo,
      'fiyat': fiyat,
      'hasPvc': hasPvc,
      'adet': adet,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      entryDate: map['entryDate'] != null ? map['entryDate'] as String : null,
      quality: map['quality'] != null ? map['quality'] as String : null,
      thickness: map['thickness'] != null ? map['thickness'] as double : null,
      en: map['en'] != null ? map['en'] as int : null,
      boy: map['boy'] != null ? map['boy'] as String : null,
      kilo: map['kilo'] != null ? map['kilo'] as String : null,
      fiyat: map['fiyat'] != null ? map['fiyat'] as String : null,
      hasPvc: map['hasPvc'] != null ? map['hasPvc'] as bool : null,
      adet: map['adet'] != null ? map['adet'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, entryDate: $entryDate, quality: $quality, thickness: $thickness, en: $en, boy: $boy, kilo: $kilo, fiyat: $fiyat, hasPvc: $hasPvc, adet: $adet)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.entryDate == entryDate &&
        other.quality == quality &&
        other.thickness == thickness &&
        other.en == en &&
        other.boy == boy &&
        other.kilo == kilo &&
        other.fiyat == fiyat &&
        other.hasPvc == hasPvc &&
        other.adet == adet;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        entryDate.hashCode ^
        quality.hashCode ^
        thickness.hashCode ^
        en.hashCode ^
        boy.hashCode ^
        kilo.hashCode ^
        fiyat.hashCode ^
        hasPvc.hashCode ^
        adet.hashCode;
  }
}
