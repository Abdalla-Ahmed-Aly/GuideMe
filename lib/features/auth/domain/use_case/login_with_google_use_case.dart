import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/services/google_signIn_service.dart';
import 'package:guide_me/features/auth/data/models/login_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginWithGoogleUseCase {
  final AuthRepo _authRepo;
  final GoogleAuthService googleAuthService;

  LoginWithGoogleUseCase(this._authRepo, this.googleAuthService);
  Future<Either<Failure, LoginresponseModel>> signWithGoogle() async {
    final token = await googleAuthService.getFirebaseIdToken();

  print("🔥🔥🔥 FIREBASE TOKEN:");
  print(token);
    if (token == null) {
      return const Left(
        AppFailure(
          failureCode: FailureCode.cancelled,
          message: "User cancelled Google Sign In",
        ),
      );
    }
    return _authRepo.loginwithgoogle(token);
  }
}
