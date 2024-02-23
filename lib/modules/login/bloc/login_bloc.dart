import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/floor_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/login_error_enum.dart';

import '../../../config/router/navigation_config.dart';
import '../events/login_event.dart';
import '../states/login_state.dart';

var loginBloc = navigationService.navigatorKey.currentContext?.read<LoginBloc>();

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FloorRepository floorRepo;
  final StorageRepository storageRepository;

  int page = 1;
  bool isLoading = false;

  LoginBloc(this.floorRepo, this.storageRepository) : super(LoginStateInit()) {
    on<LoginAttemptEvent>((event, emit) async {
      emit(LoginStateLoading());

      var q = floorRepo.findUser(event.username);
      var res = await q;

      if (res == null) {
        emit(LoginStateError(LoginError.userNotFound));
      } else {
        if (event.password == res.password) {
          storageRepository.storeIsLogin(true);
          storageRepository.storeLoggedInUsername(event.username);
          emit(LoginStateSuccess());
        } else {
          emit(LoginStateError(LoginError.userWrongCredential));
        }
      }
    });
  }
}
