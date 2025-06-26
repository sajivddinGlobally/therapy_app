import 'dart:convert';

MentalHealthavailableModel mentalHealthavailableModelFromJson(String str) =>
    MentalHealthavailableModel.fromJson(json.decode(str));

String mentalHealthavailableModelToJson(MentalHealthavailableModel data) =>
    json.encode(data.toJson());

class MentalHealthavailableModel {
  CategoryEnum? category; // ✅ CHANGED
  List<User>? users; // ✅ CHANGED

  MentalHealthavailableModel({this.category, this.users}); // ✅ CHANGED

  factory MentalHealthavailableModel.fromJson(Map<String, dynamic> json) =>
      MentalHealthavailableModel(
        category: categoryEnumValues.map[json["category"]],
        users:
            json["users"] == null
                ? []
                : List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "category": categoryEnumValues.reverse[category],
    "users":
        users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

enum CategoryEnum { MENTAL_HEALTH }

final categoryEnumValues = EnumValues({
  "Mental Health": CategoryEnum.MENTAL_HEALTH,
});

class User {
  int? id; // ✅ CHANGED
  String? name; // ✅ CHANGED
  String? email; // ✅ CHANGED
  dynamic emailVerifiedAt;
  String? profilePicture; // ✅ CHANGED
  String? token; // ✅ CHANGED
  DateTime? createdAt; // ✅ CHANGED
  DateTime? updatedAt; // ✅ CHANGED
  int? categoryId; // ✅ CHANGED
  String? specialization; // ✅ CHANGED
  String? bio; // ✅ CHANGED
  Languages? languages;
  String? rating; // ✅ CHANGED
  UserType? userType; // ✅ CHANGED
  List<SessionFee>? sessionFee;
  String? phoneNumber;
  Gender? gender;
  DateTime? dob;
  CategoryClass? category; // ✅ CHANGED

  User({
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
    this.category,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    profilePicture: json["profile_picture"],
    token: json["token"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    categoryId: json["category_id"],
    specialization: json["specialization"],
    bio: json["bio"],
    languages: languagesValues.map[json["languages"]],
    rating: json["rating"],
    userType: userTypeValues.map[json["user_type"]],
    sessionFee:
        json["session_fee"] == null
            ? null
            : List<SessionFee>.from(
              json["session_fee"].map(
                (x) => sessionFeeValues.map[x] ?? SessionFee.THE_1020,
              ),
            ),
    phoneNumber: json["phone_number"],
    gender: genderValues.map[json["gender"]],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    category:
        json["category"] == null
            ? null
            : CategoryClass.fromJson(json["category"]),
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
    "specialization": specialization,
    "bio": bio,
    "languages": languages == null ? null : languagesValues.reverse[languages],
    "rating": rating,
    "user_type": userType == null ? null : userTypeValues.reverse[userType],
    "session_fee":
        sessionFee == null
            ? []
            : List<dynamic>.from(
              sessionFee!.map((x) => sessionFeeValues.reverse[x]),
            ),
    "phone_number": phoneNumber,
    "gender": gender == null ? null : genderValues.reverse[gender],
    "dob":
        dob == null
            ? null
            : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "category": category?.toJson(),
  };
}

class CategoryClass {
  int? id;
  CategoryEnum? name;
  Description? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic image;

  CategoryClass({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory CategoryClass.fromJson(Map<String, dynamic> json) => CategoryClass(
    id: json["id"],
    name: categoryEnumValues.map[json["name"]],
    description: descriptionValues.map[json["description"]],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name == null ? null : categoryEnumValues.reverse[name],
    "description":
        description == null ? null : descriptionValues.reverse[description],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "image": image,
  };
}

enum Description { CATEGORY_FOR_PSYCHOLOGICAL_AND_EMOTIONAL_WELLBEING }

final descriptionValues = EnumValues({
  "Category for psychological and emotional wellbeing":
      Description.CATEGORY_FOR_PSYCHOLOGICAL_AND_EMOTIONAL_WELLBEING,
});

enum Gender { MALE }

final genderValues = EnumValues({"male": Gender.MALE});

enum Languages { ENGLISH_HINDI }

final languagesValues = EnumValues({"English,Hindi": Languages.ENGLISH_HINDI});

enum SessionFee { THE_1020, THE_16001800 }

final sessionFeeValues = EnumValues({
  "10,20": SessionFee.THE_1020,
  "1600,1800": SessionFee.THE_16001800,
});

enum UserType { THERAPIST }

final userTypeValues = EnumValues({"therapist": UserType.THERAPIST});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
