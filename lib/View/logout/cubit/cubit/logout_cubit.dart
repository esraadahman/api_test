import 'package:apiiiiiiiiiiiiii/core/api/api_consumer.dart';
import 'package:apiiiiiiiiiiiiii/repositories/auth_repository.dart';
import 'package:apiiiiiiiiiiiiii/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.userrepo) : super(LogoutInitial());


  final AuthRepo userrepo;

  // Future<void> logout() async {
  //   try {
  //     emit(LogoutLoading());
  //   //  final token = CacheHelper().getData(key: ApiKey.token);
  //     final response = await api.post(
  //       EndPoint.logout,
  //     );
  //      CacheHelper().removeData(key: ApiKey.token);
  //      CacheHelper().removeData(key: ApiKey.id);
  //         CacheHelper().removeData(key: ApiKey.name);
  //     print("loged out");
  //     emit(LogoutSuccess());
  //   } on DioException catch (e) {
  //     emit(LogoutFailure(errMessage: e.toString()));
  //   } catch (e) {
  //     emit(LogoutFailure(errMessage: e.toString()));
  //   }
  // }

  Future<void> logout() async {
    emit(LogoutLoading());
    //  final token = CacheHelper().getData(key: ApiKey.token);
    final response = await userrepo.logout();
    response.fold((erromessage) {
      emit(LogoutFailure(errMessage: erromessage));
    }, (LogoutModel) {
      emit(LogoutSuccess());
    });
  }
  



}
