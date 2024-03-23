import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';

import '../../../config/router/navigation_config.dart';
import '../events/splash_screen_event.dart';
import '../states/splash_screen_state.dart';

var splashScreenBloc = navigationService.navigatorKey.currentContext?.read<SplashScreenBloc>();

@injectable
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final StorageRepository storageRepository;

  SplashScreenBloc(this.storageRepository) : super(SplashScreenStateInit()) {
    on<SplashScreenNextPageEvent>((event, emit) async {
      emit(SplashScreenStateInit());
      emit(SplashScreenStateSuccess());
    });
  }
}
