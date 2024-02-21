import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/entity/user_entity.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';

import '../../../config/router/navigation_config.dart';
import '../../../domain/repositories/floor_repository.dart';
import '../events/splash_screen_event.dart';
import '../states/splash_screen_state.dart';

var splashScreenBloc = navigationService.navigatorKey.currentContext?.read<SplashScreenBloc>();

@injectable
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final StorageRepository storageRepository;
  final FloorRepository floorRepo;

  SplashScreenBloc(this.storageRepository, this.floorRepo) : super(SplashScreenStateInit()) {
    on<SplashScreenNextPageEvent>((event, emit) async {
      emit(SplashScreenStateInit());
      var isLogin = await storageRepository.getIsLogin();
      emit(SplashScreenStateSuccess(isLogin));
    });

    on<SplashScreenCheckMagnusAccountEvent>((event, emit) async {
      var checkMagnusAccount = floorRepo.findUser("magnus");
      var res = await checkMagnusAccount.first;
      if (res == null) {
        await floorRepo.insertNewUser(UserEntity(
          name: "magnus",
          password: "magnusaja",
          username: "magnus",
          phoneNo: "123123",
        ));
      }
    });
  }
}
