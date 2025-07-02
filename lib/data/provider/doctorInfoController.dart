import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/doctorInfoModel.dart';

final doctorInfoProvider = FutureProvider.family<DoctorInfoModel, String>((
  ref,
  id,
) async {
  final doctorInfService = ApiStateNetwork(createDio());
  return await doctorInfService.doctorInfo(id);
});
