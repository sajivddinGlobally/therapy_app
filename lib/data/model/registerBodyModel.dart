class UserFormStateModel {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String gender;
  final String dob;
  final int categoryId;
  final String? profilePicture;
  final String specialization;
  final String bio;
  final String languages;
  final List<String> sessionFee;
  final double rating;
  final String userType;

  UserFormStateModel({
    this.name = '',
    this.email = '',
    this.password = '',
    this.phone = '',
    this.gender = '',
    this.dob = '',
    this.categoryId = 0,
    this.profilePicture,
    this.specialization = '',
    this.bio = '',
    this.languages = '',
    this.sessionFee = const [],
    this.rating = 0.0,
    this.userType = '',
  });

  UserFormStateModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? gender,
    String? dob,
    int? categoryId,
    String? profilePicture,
    String? specialization,
    String? bio,
    String? languages,
    List<String>? sessionFee,
    double? rating,
    String? userType,
  }) {
    return UserFormStateModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      categoryId: categoryId ?? this.categoryId,
      profilePicture: profilePicture ?? this.profilePicture,
      specialization: specialization ?? this.specialization,
      bio: bio ?? this.bio,
      languages: languages ?? this.languages,
      sessionFee: sessionFee ?? this.sessionFee,
      rating: rating ?? this.rating,
      userType: userType ?? this.userType,
    );
  }
}
