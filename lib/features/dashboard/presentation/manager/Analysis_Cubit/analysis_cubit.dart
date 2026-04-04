import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'analysis_cubit_state.dart';

class AnalysisCubitCubit extends Cubit<AnalysisCubitState> {
  AnalysisCubitCubit() : super(AnalysisCubitInitial());
}
