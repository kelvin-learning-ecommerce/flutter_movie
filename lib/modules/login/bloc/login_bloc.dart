import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';

import '../../../config/router/navigation_config.dart';
import '../../../domain/models/response/news_response.dart';
import '../../../domain/repositories/api_repository.dart';
import '../events/login_event.dart';
import '../states/login_state.dart';

var loginBloc = navigationService.navigatorKey.currentContext?.read<LoginBloc>();

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository apiRepository;
  final StorageRepository storageRepository;

  int page = 1;
  bool isLoading = false;

  LoginBloc(this.apiRepository, this.storageRepository) : super(LoginStateInit()) {
    on<LoginAttemptEvent>((event, emit) async {
      emit(LoginStateLoading());

      if(event.username == "magnus" && event.password=="magnusaja"){
        storageRepository.storeIsLogin(true);
        emit(LoginStateSuccess());
      }else{
        emit(LoginStateError());
      }
    });
  }
}
