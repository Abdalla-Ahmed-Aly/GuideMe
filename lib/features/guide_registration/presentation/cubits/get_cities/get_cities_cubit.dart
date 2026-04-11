import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/shared/models/city_model.dart';
import 'package:guide_me/features/guide_registration/data/sources/guide_registration_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class GetCitiesState {}

class GetCitiesInitial extends GetCitiesState {}
class GetCitiesLoading extends GetCitiesState {}
class GetCitiesSuccess extends GetCitiesState {
  final List<CityModel> cities;
  GetCitiesSuccess(this.cities);
}
class GetCitiesError extends GetCitiesState {
  final String message;
  GetCitiesError(this.message);
}

@injectable
class GetCitiesCubit extends Cubit<GetCitiesState> {
  final GuideRegistrationDataSource _dataSource;

  GetCitiesCubit(this._dataSource) : super(GetCitiesInitial());

  Future<void> getCities() async {
    emit(GetCitiesLoading());
    try {
      final cities = await _dataSource.getAllCities();
      emit(GetCitiesSuccess(cities));
    } catch (e) {
      emit(GetCitiesError(e.toString()));
    }
  }
}
