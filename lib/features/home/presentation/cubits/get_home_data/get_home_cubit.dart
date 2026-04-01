import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHomeCubit extends Cubit<GetHomeState> {
  final HomeRepo _homeRepo;

  GetHomeCubit(this._homeRepo) : super(GetHomeInitial());

  Future<void> getHomeData() async {
    emit(GetHomeLoading());
    final result = await _homeRepo.getHomeData();
    result.fold(
      (failure) => emit(GetHomeFailure(failure)),
      (homeData) => emit(GetHomeSuccess(homeData)),
    );
  }
}
