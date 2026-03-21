import 'package:guide_me/features/booking/data/models/book_package_response_model.dart';
import 'package:guide_me/features/booking/presentation/args/package_args.dart';

class BookPackageArgs {
  final BookPackageResponseModel bookPackageResponseModel;
  final PackageArgs packageArgs;
  
  BookPackageArgs({
    required this.bookPackageResponseModel,
    required this.packageArgs,
  });
}
