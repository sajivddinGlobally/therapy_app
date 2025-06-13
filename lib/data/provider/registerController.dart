import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/data/model/registerModel.dart';

class UserFormNotifier extends StateNotifier<UserFormStateModel> {
  UserFormNotifier() : super(UserFormStateModel());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setCategoryId(int id) {
    state = state.copyWith(categoryId: id);
  }

  void setPhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  void setProfilePicture(String path) {
    state = state.copyWith(profilePicture: path);
  }

  void setSpecialization(String specialization) {
    state = state.copyWith(specialization: specialization);
  }

  void setBio(String bio) {
    state = state.copyWith(bio: bio);
  }

  void setLanguage(String language) {
    state = state.copyWith(language: language);
  }

  void setSessionFee(List<String> fees) {
    state = state.copyWith(sessionFee: fees);
  }

  void setRating(double rating) {
    state = state.copyWith(rating: rating);
  }

  void setUserType(String type) {
    state = state.copyWith(userType: type);
  }
}

final registerFormProvider =
    StateNotifierProvider<UserFormNotifier, UserFormStateModel>(
      (ref) => UserFormNotifier(),
    );
