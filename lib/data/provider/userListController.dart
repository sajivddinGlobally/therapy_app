import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/userListModel.dart';

final userListController = FutureProvider<UserListModel>((ref) async {
  final userListSerivce = ApiStateNetwork(createDio());
  return await userListSerivce.fetchUserList();
});
