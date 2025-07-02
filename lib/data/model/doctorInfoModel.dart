class DoctorInfoModel {
  final bool? success;
  final List<Datum>? data;

  DoctorInfoModel({
    this.success,
    this.data,
  });

  factory DoctorInfoModel.fromJson(Map<String, dynamic> json) => DoctorInfoModel(
    success: json["success"],
    data: json["data"] == null
        ? null
        : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.map((x) => x.toJson()).toList(),
  };
}

class Datum {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final String? profilePicture;
  final String? token;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? categoryId;
  final Specialization? specialization;
  final Bio? bio;
  final Languages? languages;
  final String? rating;
  final UserType? userType;
  final List<SessionFee>? sessionFee;
  final String? phoneNumber;
  final Gender? gender;
  final DateTime? dob;

  Datum({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.profilePicture,
    this.token,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.specialization,
    this.bio,
    this.languages,
    this.rating,
    this.userType,
    this.sessionFee,
    this.phoneNumber,
    this.gender,
    this.dob,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    profilePicture: json["profile_picture"],
    token: json["token"],
    createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.tryParse(json["updated_at"]),
    categoryId: json["category_id"],
    specialization: json["specialization"] == null ? null : specializationValues.map[json["specialization"]],
    bio: json["bio"] == null ? null : bioValues.map[json["bio"]],
    languages: json["languages"] == null ? null : languagesValues.map[json["languages"]],
    rating: json["rating"],
    userType: json["user_type"] == null ? null : userTypeValues.map[json["user_type"]],
    sessionFee: json["session_fee"] == null
        ? null
        : List<SessionFee>.from(
            json["session_fee"].map((x) => sessionFeeValues.map[x] ?? SessionFee.THE_1020),
          ),
    phoneNumber: json["phone_number"],
    gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
    dob: json["dob"] == null ? null : DateTime.tryParse(json["dob"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "profile_picture": profilePicture,
    "token": token,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "category_id": categoryId,
    "specialization": specialization == null ? null : specializationValues.reverse[specialization],
    "bio": bio == null ? null : bioValues.reverse[bio],
    "languages": languages == null ? null : languagesValues.reverse[languages],
    "rating": rating,
    "user_type": userType == null ? null : userTypeValues.reverse[userType],
    "session_fee": sessionFee?.map((x) => sessionFeeValues.reverse[x]).toList(),
    "phone_number": phoneNumber,
    "gender": gender == null ? null : genderValues.reverse[gender],
    "dob": dob?.toIso8601String(),
  };
}

enum Bio {
  ADDICTION,
  EATING_DISORDERS,
  HELPING_PEOPLE_HEAL,
  HELPING_YOUTH_WITH_MENTAL_WELLNESS,
  PTSD
}

final bioValues = EnumValues({
  "Addiction": Bio.ADDICTION,
  "Eating Disorders": Bio.EATING_DISORDERS,
  "Helping people heal.": Bio.HELPING_PEOPLE_HEAL,
  "Helping youth with mental wellness": Bio.HELPING_YOUTH_WITH_MENTAL_WELLNESS,
  "PTSD": Bio.PTSD
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE
});

enum Languages { ENGLISH_HINDI }

final languagesValues = EnumValues({
  "English,Hindi": Languages.ENGLISH_HINDI
});

enum SessionFee { THE_1020, THE_16001800 }

final sessionFeeValues = EnumValues({
  "10,20": SessionFee.THE_1020,
  "1600,1800": SessionFee.THE_16001800
});

enum Specialization {
  ADDICTION,
  CLINICAL_PSYCHOLOGIST,
  CLINICAL_PSYCHOLOGY,
  EATING_DISORDERS,
  PTSD
}

final specializationValues = EnumValues({
  "Addiction": Specialization.ADDICTION,
  "Clinical Psychologist": Specialization.CLINICAL_PSYCHOLOGIST,
  "Clinical Psychology": Specialization.CLINICAL_PSYCHOLOGY,
  "Eating Disorders": Specialization.EATING_DISORDERS,
  "PTSD": Specialization.PTSD
});

enum UserType { THERAPIST }

final userTypeValues = EnumValues({
  "therapist": UserType.THERAPIST
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
