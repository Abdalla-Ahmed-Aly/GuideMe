import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/app_countries.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/domain/entities/nationality_entity.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

part 'select_nationality_state.dart';

@injectable
class SelectNationalityCubit extends Cubit<SelectNationalityState> {
  SelectNationalityCubit(this.authRepo)
    : super(SelectNationalityInitial(SelectNationalityData.initial()));

  final AuthRepo authRepo;

  void safeEmit(SelectNationalityState state) {
    if (!isClosed) emit(state);
  }

  void selectNationality(NationalityEntity nationality) {
    safeEmit(
      state.copyWith(
        state.data.copyWith(selectedNationality: nationality),
      ),
    );
  }

  void search(String query) {
    final filtered = query.isEmpty
        ? state.data.nationalities
        : state.data.nationalities
              .where((n) => n.name.toLowerCase().contains(query.toLowerCase()))
              .toList();

    final currentSelected = state.data.selectedNationality;
    final isSelectedInFiltered = currentSelected != null &&
        filtered.any((n) => n.name == currentSelected.name);

    emit(
      state.copyWith(
        state.data.copyWith(
          search: query,
          filteredNationalities: filtered,
          selectedNationality:
              isSelectedInFiltered ? currentSelected : null,
        ),
      ),
    );
  }

  void addNationality() async {
    safeEmit(SelectNationalityLoading(state.data));
    if (state.data.selectedNationality == null) return;
    final result = await authRepo.addNationality(
      nationality: state.data.selectedNationality!.name,
    );
    result.fold(
      (failure) {
        safeEmit(SelectNationalityFailure(state.data, failure));
      },
      (response) {
        safeEmit(SelectNationalitySuccess(state.data));
      },
    );
  }

  void resetState() {
    emit(SelectNationalityInitial(state.data));
  }
}
