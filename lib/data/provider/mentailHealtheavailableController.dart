import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/mentalHealthavailabeModel.dart';

final availableTherapyController = FutureProvider.family
    .autoDispose<MentalHealthavailableModel, String>((ref, query) async {
      final findService = ApiStateNetwork(createDio());
      return findService.findAvailableTherapy(query);
    });
