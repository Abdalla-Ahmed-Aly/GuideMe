import 'package:guide_me/core/entities/category_entity.dart';
import 'package:guide_me/core/models/category_model.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CategoryModel categoryModel) {
    return CategoryEntity(
      id: categoryModel.id,
      name: categoryModel.name,
      image: categoryModel.image,
      slug: categoryModel.slug,
    );
  }
}
