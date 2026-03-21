import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/guide_details_entity.dart';
import 'package:guide_me/features/booking/domain/use_cases/get_guide_data_use_case.dart';
import 'package:injectable/injectable.dart';

part 'guide_data_state.dart';

@injectable
class GuideDataCubit extends Cubit<GuideDataState> {
  GuideDataCubit(this._getGuideDataUseCase) : super(GuideDataInitial());

  final GetGuideDataUseCase _getGuideDataUseCase;

  Future<void> getGuideData({required String guideId}) async {
    emit(GuideDataLoading());
    final result = await _getGuideDataUseCase(guideId: guideId);
    result.fold(
      (failure) => emit(GuideDataFailure(failure)),
      (guide) => emit(GuideDataSuccess(guide)),
    );
  }
}
