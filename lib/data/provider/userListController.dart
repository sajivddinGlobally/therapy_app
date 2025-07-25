
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/userListModel.dart';

final userListController = FutureProvider<UserListModel>((ref) async {
  final userListSerivce = ApiStateNetwork(createDio());
  return await userListSerivce.fetchUserList();
});


///  state Notifier se service get api ki


// class UserListNotifier extends StateNotifier<AsyncValue<UserListModel>> {
//   UserListNotifier() : super(AsyncValue.loading()) {
//     fetchUserList();
//   }

//   Future<void> fetchUserList() async {
//     try {
//       final userService = ApiStateNetwork(createDio());
//       final service = await userService.fetchUserList();
//       state = AsyncData(service);
//       log(service.bookings.toString());
//     } catch (e, s) {
//       state = AsyncError(e, s);
//       log(e.toString());
//     }
//   }
// }

// final userListProvider =
//     StateNotifierProvider<UserListNotifier, AsyncValue<UserListModel>>(
//       (ref) => UserListNotifier(),
//     );
