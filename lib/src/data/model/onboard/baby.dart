class BabySitterModel {
  final String? uid;
  final String? adresse;
  final int? numeroPostale;
  final String? dependance;
  final String? imageCinBack;
  final String? imageCinFront;
  final int? anneExperience;
  final String? description;
  final String? langueMaternelle;
  final String? langueAutre;
  final bool? gardeEnfant;
  final double? coutenfant1;
  final double? coutenfants2;
  final double? coutenfants3;
  final double? coutenfants4;
  final double? coutenfants5;
  final bool? isVerified;

  BabySitterModel({
    this.uid,
    this.adresse,
    this.numeroPostale,
    this.dependance,
    this.imageCinFront,
    this.imageCinBack,
    this.anneExperience,
    this.description,
    this.langueMaternelle,
    this.langueAutre,
    this.gardeEnfant,
    this.coutenfant1,
    this.coutenfants2,
    this.coutenfants3,
    this.coutenfants4,
    this.coutenfants5,
    this.isVerified,
  });

  factory BabySitterModel.fromJson(Map<String, dynamic> json) {
    return BabySitterModel(
        uid: json['uid'],
        adresse: json['adresse'],
        numeroPostale: json['numero_postale'],
        dependance: json['dependance'],
        imageCinBack: json['image_cin_back'],
        imageCinFront: json['image_cin_front'],
        anneExperience: json['anne_experience'],
        description: json['description'],
        langueMaternelle: json['langue_maternelle'],
        langueAutre: json['langue_autre'],
        coutenfant1: (json['coutenfant1'] ?? 0).toDouble(),
        coutenfants2: (json['coutenfants2'] ?? 0).toDouble(),
        coutenfants3: (json['coutenfants3'] ?? 0).toDouble(),
        coutenfants4: (json['coutenfants4'] ?? 0).toDouble(),
        coutenfants5: (json['coutenfants5'] ?? 0).toDouble(),
        isVerified: json['is_verified']);
  }

  Map<String, dynamic> toJson() {
    return {
      // 'uid': uid,
      'adresse': adresse,
      'numero_postale': numeroPostale,
      'dependance': dependance,
      'image_cin_back': imageCinBack,
      'image_cin_front': imageCinFront,
      'anne_experience': anneExperience,
      'description': description,
      'langue_maternelle': langueMaternelle,
      'langue_autre': langueAutre,
      'coutenfant1 ': coutenfant1,
      'coutenfants2 ': coutenfants2,
      'coutenfants3 ': coutenfants3,
      'coutenfants4': coutenfants4,
      'coutenfants5': coutenfants5,
      'is_verified': isVerified,
    };
  }

  @override
  String toString() {
    return 'BabySitterModel{uid: $uid, adresse: $adresse, numero_postale: $numeroPostale, dependance: $dependance, image_cin_back: $imageCinBack, image_cin_front: $imageCinFront, anne_experience: $anneExperience, description: $description, langue_maternelle: $langueMaternelle, langue_autre: $langueAutre, coutenfant1 : $coutenfant1, coutenfants2 : $coutenfants2, coutenfants3 : $coutenfants3, coutenfants4 : $coutenfants4, coutenfants5 : $coutenfants5, is_verified: $isVerified}';
  }
}
