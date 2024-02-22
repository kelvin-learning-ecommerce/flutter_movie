import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/entity/user_entity.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/floor_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/events/register_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/login_error_enum.dart';

import '../../../config/router/navigation_config.dart';
import '../../../utils/enum/register_error_enum.dart';
import '../states/register_state.dart';

var registerBloc = navigationService.navigatorKey.currentContext?.read<RegisterBloc>();

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final FloorRepository floorRepo;
  final StorageRepository storageRepository;

  int page = 1;
  bool isLoading = false;

  RegisterBloc(this.floorRepo, this.storageRepository) : super(RegisterStateInit()) {
    on<RegisterAttemptEvent>((event, emit) async {
      emit(RegisterStateInit());
      if (event.name.isEmpty) {
        emit(RegisterStateError(RegisterError.nameError));
      } else if (event.phoneno.isEmpty) {
        emit(RegisterStateError(RegisterError.phoneNoError));
      } else if (event.username.isEmpty) {
        emit(RegisterStateError(RegisterError.usernameError));
      } else if (event.password.isEmpty) {
        emit(RegisterStateError(RegisterError.passwordError));
      } else {
        var q = floorRepo.findUser(event.username);
        var res = await q;

        if (res == null) {
          await floorRepo.insertNewUser(UserEntity(
            name: event.name,
            password: event.password,
            username: event.username,
            phoneNo: event.phoneno,
          ));
          emit(RegisterStateSuccess());
        }else{
          emit(RegisterStateError(RegisterError.usernameFoundError));
        }


      }
    });
  }
}
