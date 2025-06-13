class UserFormStateModel {
  final String email;
  final String name;
  final String password;
  final String phone;
  final int categoryId;
  final String profilePicture;
  final String specialization;
  final String bio;
  final String language;
  final List<String> sessionFee;
  final double rating;
  final String userType;

  UserFormStateModel({
    this.email = '',
    this.name = '',
    this.password = '',
    this.phone = '',
    this.categoryId = 0,
    this.profilePicture = '',
    this.specialization = '',
    this.bio = '',
    this.language = '',
    this.sessionFee = const [],
    this.rating = 0.0,
    this.userType = '',
  });

  UserFormStateModel copyWith({
    String? email,
    String? name,
    String? password,
    String? phone,
    int? categoryId,
    String? profilePicture,
    String? specialization,
    String? bio,
    String? language,
    List<String>? sessionFee,
    double? rating,
    String? userType,
  }) {
    return UserFormStateModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      categoryId: categoryId ?? this.categoryId,
      profilePicture: profilePicture ?? this.profilePicture,
      specialization: specialization ?? this.specialization,
      bio: bio ?? this.bio,
      language: language ?? this.language,
      sessionFee: sessionFee ?? this.sessionFee,
      rating: rating ?? this.rating,
      userType: userType ?? this.userType,
    );
  }
}
