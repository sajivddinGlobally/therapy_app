import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/accountModel.dart';

final accounProfileProvider = FutureProvider.autoDispose<AccountModel>((
  ref,
) async {
  final profileService = ApiStateNetwork(await createDio());
  return profileService.account();
});
