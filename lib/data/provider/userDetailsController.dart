import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/userlistByIDResModel.dart';

final userDetailsController = FutureProvider.family<UserListByIdModel, String>((
  ref,
  id,
) async {
  final userDetailsService = ApiStateNetwork(createDio());
  return await userDetailsService.userDetails(id);
});
