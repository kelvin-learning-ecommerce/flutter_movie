import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/floor_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/profile/events/profile_event.dart';

import '../../../config/router/navigation_config.dart';
import '../states/profile_state.dart';

var profileBloc = navigationService.navigatorKey.currentContext?.read<ProfileBloc>();

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FloorRepository floorRepo;
  final StorageRepository storageRepository;

  ProfileBloc(this.floorRepo, this.storageRepository) : super(ProfileStateInit()) {
    on<ProfileLoadEvent>((event, emit) async {
      emit(ProfileStateInit());
      var currUsername = await storageRepository.fetchLoggedInUsername();
      var q = await floorRepo.findUser(currUsername ?? "");

      if (q != null) {
        emit(ProfileStateLoadSuccess(q));
      }
    });
    on<ProfileLogoutAttemptEvent>((event, emit) async {
      emit(ProfileStateInit());

      storageRepository.storeIsLogin(false);

      emit(ProfileStateLogoutSuccess());
    });
  }
}
