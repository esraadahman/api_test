
import 'package:apiiiiiiiiiiiiii/View/create_post/model/addpost_model.dart';
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



class userRepo {
  final ApiConsumer api;

  userRepo({required this.api});


  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final response = await api.get(
        EndPoint.getuserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, Map<String , dynamic>>> getdataChach() async {
    print("enter function");
    try {
      final Map<String, dynamic> data = {};
      data[ApiKey.email] = await CacheHelper().getData(key: ApiKey.email);
      data[ApiKey.name] = await CacheHelper().getData(key: ApiKey.name);
      data[ApiKey.token] = await CacheHelper().getData(key: ApiKey.token);
      print(
          "email ${data[ApiKey.email]}   name ${data[ApiKey.name]}  token ${data[ApiKey.token]}");

      print("end function ");
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }




  // Future<Either<String, HomeModel>> getallPosts() async {
  //   try {
  //     final response = await api.get(
  //       EndPoint.getallPosts,
  //     );
  //     final posts = HomeModel.fromJson(response);
  //     return Right(posts);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.message);
  //   }
  // }

  Future<Either<String, AddPostModel>> addPosts(
      String title, String des) async {
    try {
      String? user_id = CacheHelper().getData(key: ApiKey.id).toString();
      final response =
          await api.post(EndPoint.createPosts, isFromData: true, data: {
        ApiKey.title: title,
        ApiKey.description: des,
        ApiKey.user_id: user_id,
      });

      final added = AddPostModel.fromJson(response);

      return Right(added);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
