// To parse this JSON data, do
//
//     final mentalHealthavailableModel = mentalHealthavailableModelFromJson(jsonString);

import 'dart:convert';

MentalHealthavailableModel mentalHealthavailableModelFromJson(String str) => MentalHealthavailableModel.fromJson(json.decode(str));

String mentalHealthavailableModelToJson(MentalHealthavailableModel data) => json.encode(data.toJson());

class MentalHealthavailableModel {
    CategoryEnum category;
    List<User> users;

    MentalHealthavailableModel({
        required this.category,
        required this.users,
    });

    factory MentalHealthavailableModel.fromJson(Map<String, dynamic> json) => MentalHealthavailableModel(
        category: categoryEnumValues.map[json["category"]]!,
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category": categoryEnumValues.reverse[category],
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

enum CategoryEnum {
    MENTAL_HEALTH
}

final categoryEnumValues = EnumValues({
    "Mental Health": CategoryEnum.MENTAL_HEALTH
});

class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String? profilePicture;
    String token;
    DateTime createdAt;
    DateTime updatedAt;
    int categoryId;
    String specialization;
    String bio;
    Languages? languages;
    String rating;
    UserType userType;
    List<SessionFee>? sessionFee;
    String? phoneNumber;
    Gender? gender;
    DateTime? dob;
    CategoryClass category;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.profilePicture,
        required this.token,
        required this.createdAt,
        required this.updatedAt,
        required this.categoryId,
        required this.specialization,
        required this.bio,
        required this.languages,
        required this.rating,
        required this.userType,
        required this.sessionFee,
        required this.phoneNumber,
        required this.gender,
        required this.dob,
        required this.category,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        profilePicture: json["profile_picture"],
        token: json["token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryId: json["category_id"],
        specialization: json["specialization"],
        bio: json["bio"],
        languages: languagesValues.map[json["languages"]]!,
        rating: json["rating"],
        userType: userTypeValues.map[json["user_type"]]!,
        sessionFee: json["session_fee"] == null ? [] : List<SessionFee>.from(json["session_fee"]!.map((x) => sessionFeeValues.map[x]!)),
        phoneNumber: json["phone_number"],
        gender: genderValues.map[json["gender"]]!,
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        category: CategoryClass.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "profile_picture": profilePicture,
        "token": token,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category_id": categoryId,
        "specialization": specialization,
        "bio": bio,
        "languages": languagesValues.reverse[languages],
        "rating": rating,
        "user_type": userTypeValues.reverse[userType],
        "session_fee": sessionFee == null ? [] : List<dynamic>.from(sessionFee!.map((x) => sessionFeeValues.reverse[x])),
        "phone_number": phoneNumber,
        "gender": genderValues.reverse[gender],
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "category": category.toJson(),
    };
}

class CategoryClass {
    int id;
    CategoryEnum name;
    Description description;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic image;

    CategoryClass({
        required this.id,
        required this.name,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.image,
    });

    factory CategoryClass.fromJson(Map<String, dynamic> json) => CategoryClass(
        id: json["id"],
        name: categoryEnumValues.map[json["name"]]!,
        description: descriptionValues.map[json["description"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": categoryEnumValues.reverse[name],
        "description": descriptionValues.reverse[description],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
    };
}

enum Description {
    CATEGORY_FOR_PSYCHOLOGICAL_AND_EMOTIONAL_WELLBEING
}

final descriptionValues = EnumValues({
    "Category for psychological and emotional wellbeing": Description.CATEGORY_FOR_PSYCHOLOGICAL_AND_EMOTIONAL_WELLBEING
});

enum Gender {
    MALE
}

final genderValues = EnumValues({
    "male": Gender.MALE
});

enum Languages {
    ENGLISH_HINDI
}

final languagesValues = EnumValues({
    "English,Hindi": Languages.ENGLISH_HINDI
});

enum SessionFee {
    THE_1020,
    THE_16001800
}

final sessionFeeValues = EnumValues({
    "10,20": SessionFee.THE_1020,
    "1600,1800": SessionFee.THE_16001800
});

enum UserType {
    THERAPIST
}

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
