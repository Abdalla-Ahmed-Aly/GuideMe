import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/guide_registration_repository.dart';
import 'package:injectable/injectable.dart';

abstract class VerificationStatusState {}

class VerificationStatusInitial extends VerificationStatusState {}
class VerificationStatusLoading extends VerificationStatusState {}
class VerificationStatusPending extends VerificationStatusState {}
class VerificationStatusApproved extends VerificationStatusState {}
class VerificationStatusRejected extends VerificationStatusState {
  final String? reason;
  VerificationStatusRejected(this.reason);
}
class VerificationStatusError extends VerificationStatusState {
  final String message;
  VerificationStatusError(this.message);
}

@injectable
class VerificationStatusCubit extends Cubit<VerificationStatusState> {
  final GuideRegistrationRepository _repository;
  Timer? _timer;

  VerificationStatusCubit(this._repository) : super(VerificationStatusInitial());

  void checkStatus() async {
    emit(VerificationStatusLoading());
    _fetchStatus();
    
    // Start polling every 10 seconds while pending
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (state is VerificationStatusPending || state is VerificationStatusInitial) {
        _fetchStatus();
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _fetchStatus() async {
    try {
      final response = await _repository.getVerificationStatus();
      final data = response.data['data'];
      final String status = data['status']; // "pending", "approved", "rejected"

      if (status == 'approved') {
        emit(VerificationStatusApproved());
        _timer?.cancel();
      } else if (status == 'rejected') {
        final reason = data['message'];
        emit(VerificationStatusRejected(reason));
        _timer?.cancel();
      } else {
        emit(VerificationStatusPending());
      }
    } catch (e) {
      // Don't emit error for polling if it's already pending, just keep waiting
      if (state is! VerificationStatusPending) {
        emit(VerificationStatusError(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
