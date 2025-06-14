import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/categoryModel.dart';

final categoryProvider = FutureProvider<CategoryModel>((ref) async {
  final categoryService = ApiStateNetwork(await createDio());
  return categoryService.getCategory();
});
