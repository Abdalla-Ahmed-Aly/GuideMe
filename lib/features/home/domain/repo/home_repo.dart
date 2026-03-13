import 'package:dartz/dartz.dart';



abstract class HomeRepo {
  Future<Either> getHomeData();
  Future<Either> getPlacesByCategory({
    required String categoryId,
  });
}
