import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/bookingsModel.dart';

final bookingsControlelr = FutureProvider.autoDispose<List<BookingsModel>>((
  ref,
) async {
  final bookingService = ApiStateNetwork(createDio());
  return await bookingService.bookings();
});
