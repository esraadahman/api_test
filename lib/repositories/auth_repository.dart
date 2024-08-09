import 'package:apiiiiiiiiiiiiii/core/api/api_consumer.dart';
import 'package:apiiiiiiiiiiiiii/View/logout/model/logoutModel.dart';
import 'package:apiiiiiiiiiiiiii/View/profile/model/usermodel.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/models/sign_inModel.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_up/models/sign_upmodel.dart';
import 'package:apiiiiiiiiiiiiii/cache/cache_healper.dart';
import 'package:apiiiiiiiiiiiiii/core/api/api_consumer.dart';
import 'package:apiiiiiiiiiiiiii/core/api/endPointes.dart';
import 'package:apiiiiiiiiiiiiii/core/errors/exceptions.dart';
import 'package:apiiiiiiiiiiiiii/core/functions/imagepacker.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});




    Future<Either<String, SignInModel>> sign_in(
      {required String email, required String pass}) async {
    try {
      final response = await api.post(EndPoint.signin,
          data: {ApiKey.email: email, ApiKey.password: pass}, isFromData: true);
      final user = SignInModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user.data.token);
      CacheHelper().saveData(key: ApiKey.id, value: user.data.user.id);
      CacheHelper().saveData(key: ApiKey.email, value: user.data.user.email);
      CacheHelper().saveData(key: ApiKey.name, value: user.data.user.name);
      CacheHelper().saveData(key: ApiKey.image, value: user.data.user.image);
      CacheHelper().saveData(key: ApiKey.bio, value: user.data.user.bio);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, SignUpModel>> sign_up({
    required String email,
    required String pass,
    required String name,
    required String bio,
    required XFile profilePic,
  }) async {
    try {
      final response = await api.post(EndPoint.signup, isFromData: true, data: {
        ApiKey.email: email,
        ApiKey.password: pass,
        ApiKey.name: name,
// to send image
        ApiKey.image: await uploadImageToAPI(profilePic)
      });
      final user = SignUpModel.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, LogoutModel>> logout() async {
    try {
      final response = await api.post(
        EndPoint.logout,
      );
      CacheHelper().removeData(key: ApiKey.token);
      CacheHelper().removeData(key: ApiKey.id);
      CacheHelper().removeData(key: ApiKey.name);
      final response2 = LogoutModel.fromJson(response);

      return Right(response2);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

}
