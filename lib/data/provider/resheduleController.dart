import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/resheduleBodyModel.dart';
import 'package:therapy_app/data/model/resheduleResModel.dart';

class RescheduleFlowState {
  final String? selectedDate;
  final String? selectedTimeSlot;
  final String? reason;
  final String? message;
  final bool isFormComplete;
  final ResheduleResModel? response;

  RescheduleFlowState({
    this.selectedDate,
    this.selectedTimeSlot,
    this.reason,
    this.message,
    this.response,
    this.isFormComplete = false,
  });

  RescheduleFlowState copyWith({
    String? selectedDate,
    String? selectedTimeSlot,
    String? reason,
    String? message,
    bool? isFormComplete,
    ResheduleResModel? response,
  }) {
    return RescheduleFlowState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTimeSlot: selectedTimeSlot ?? this.selectedTimeSlot,
      reason: reason ?? this.reason,
      message: message ?? this.message,
      response: response ?? this.response,
      isFormComplete: isFormComplete ?? this.isFormComplete,
    );
  }
}

class RescheduleNotifier
    extends StateNotifier<AsyncValue<RescheduleFlowState>> {
  final ApiStateNetwork api;

  RescheduleNotifier(this.api) : super(AsyncValue.data(RescheduleFlowState()));

  void setDate(String date) {
    state = state.whenData((value) => value.copyWith(selectedDate: date));
  }

  void setTimeSlot(String slot) {
    state = state.whenData((value) => value.copyWith(selectedTimeSlot: slot));
  }

  void setReason(String reason) {
    state = state.whenData((value) => value.copyWith(reason: reason));
  }

  void setMessage(String message) {
    state = state.whenData((value) => value.copyWith(message: message));
  }

  Future<void> submitReschedule(int bookingId) async {
    final flowState = state.value;
    if (flowState == null) return;

    state = const AsyncValue.loading();

    try {
      final body = ResheduleBodyModel(
        bookingId: bookingId,
        date:
            flowState.selectedDate != null && flowState.selectedDate!.isNotEmpty
                ? DateTime.parse(flowState.selectedDate!)
                : DateTime.now(),
        timeSlot: flowState.selectedTimeSlot ?? '',
        reason: flowState.reason ?? '',
        message: flowState.message ?? '',
      );

      final response = await api.reshedule(body);
      log(response.message);
      state = AsyncValue.data(
        flowState.copyWith(response: response, isFormComplete: true),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      log(e.toString());
    }
  }
}

final rescheduleFlowProvider =
    StateNotifierProvider<RescheduleNotifier, AsyncValue<RescheduleFlowState>>(
      (ref) => RescheduleNotifier(ApiStateNetwork(createDio())),
    );
