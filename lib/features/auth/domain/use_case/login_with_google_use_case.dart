import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/services/google_signIn_service.dart';
import 'package:guide_me/features/auth/data/models/login_model.dart';
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class LoginWithGoogleUseCase {
  final AuthRepo _authRepo;
  final GoogleAuthService googleAuthService;
  final Logger _logger = Logger();

  LoginWithGoogleUseCase(this._authRepo, this.googleAuthService);
  Future<Either<Failure, LoginresponseModel>> signWithGoogle() async {
    _logger.i("Attempting to sign in with Google.");
    final token = await googleAuthService.getFirebaseIdToken();

    _logger.d("Firebase ID Token: $token");

    if (token == null) {
      _logger.w(
        "Google Sign In was cancelled by the user or failed to retrieve token.",
      );
      return const Left(
        AppFailure(
          failureCode: FailureCode.cancelled,
          message: "User cancelled Google Sign In",
        ),
      );
    }
    _logger.i("Passing Google token to authentication repository.");
    return _authRepo.loginwithgoogle(token);
  }
}
