import 'package:guide_me/core/shared/entities/category_entity.dart';
import 'package:guide_me/core/shared/models/category_model.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CategoryModel categoryModel) {
    return CategoryEntity(
      id: categoryModel.id ?? "Unkown",
      name: categoryModel.name ?? "Unkown",
      image: categoryModel.image,
      slug: categoryModel.slug,
    );
  }
}
