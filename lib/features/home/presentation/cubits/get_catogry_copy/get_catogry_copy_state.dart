part of 'get_catogry_copy_cubit.dart';

sealed class GetCatogryCopyState {}

final class GetCatogryCopyInitial extends GetCatogryCopyState {}

final class GetCatogryCopyLoading extends GetCatogryCopyState {}

final class GetCatogryCopySuccess extends GetCatogryCopyState {
  final List<GetCategoriesResponse> categories;

  GetCatogryCopySuccess({required this.categories});

}

final class GetCatogryCopyFailure extends GetCatogryCopyState {
  final Failure failure;

  GetCatogryCopyFailure(this.failure);
}
