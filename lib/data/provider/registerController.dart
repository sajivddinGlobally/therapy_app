import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/registerBodyModel.dart';

class UserFormNotifier extends StateNotifier<UserFormStateModel> {
  final ApiStateNetwork api;
  UserFormNotifier(this.api) : super(UserFormStateModel());

  void setName(String name) => state = state.copyWith(name: name);

  void setEmail(String email) => state = state.copyWith(email: email);

  void setPassword(String password) =>
      state = state.copyWith(password: password);

  void setPhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  void setGender(String gender) => state = state.copyWith(gender: gender);

  void setDOB(String dob) => state = state.copyWith(dob: dob);

  void setCategoryId(int id) => state = state.copyWith(categoryId: id);

  void setProfilePicture(String path) =>
      state = state.copyWith(profilePicture: path);

  void setSpecialization(String specialization) =>
      state = state.copyWith(specialization: specialization);

  void setBio(String bio) => state = state.copyWith(bio: bio);

  void setLanguages(String languages) =>
      state = state.copyWith(languages: languages);

  void setSessionFee(List<String> fees) =>
      state = state.copyWith(sessionFee: fees);

  void setRating(double rating) => state = state.copyWith(rating: rating);

  void setUserType(String type) => state = state.copyWith(userType: type);

  Future<void> registerUser() async {
    try {
      final res = await api.register(
        name: state.name ?? '',
        email: state.email ?? '',
        password: state.password ?? '',
        categoryId: state.categoryId ?? 0,
        specialization: state.specialization ?? '',
        bio: state.bio ?? '',
        languages: state.languages ?? '',
        sessionFee: state.sessionFee ?? [],
        rating: (state.rating ?? 0.0).toString(),
        userType: state.userType ?? '',
      );
      log("✅ Registered: ${res.response.statusCode}");
    } catch (e) {
      log("❌ Registration failed: $e");
      rethrow;
    }
  }
}

final registerFormProvider =
    StateNotifierProvider<UserFormNotifier, UserFormStateModel>(
      (ref) => UserFormNotifier(ApiStateNetwork(createDio())),
    );
