import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/entity/user_entity.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/floor_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/bloc/login_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/events/login_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/states/login_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/login_error_enum.dart';
import 'package:mocktail/mocktail.dart';

class MockFloorRepository extends Mock implements FloorRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

void main() {
  late MockFloorRepository mockFloorRepository;
  late MockStorageRepository mockStorageRepository;
  late LoginBloc loginBloc;

  setUp(() async {
    mockFloorRepository = MockFloorRepository();
    mockStorageRepository = MockStorageRepository();
    loginBloc = LoginBloc(mockFloorRepository, mockStorageRepository);
  });

  blocTest<LoginBloc, LoginState>("Test Login Bloc Success State",
      build: () {
        when(() => mockFloorRepository.findUser("kelvin")).thenAnswer((_) async => Future.value(UserEntity(
              name: "kelvin",
              password: "kelvin",
              phoneNo: "123",
              username: "kelvin",
            )));
        when(() => mockStorageRepository.storeIsLogin(true)).thenAnswer((_) async => Future.value());
        when(() => mockStorageRepository.storeLoggedInUsername("kelvin")).thenAnswer((_) async => Future.value());

        return loginBloc;
      },
      act: (bloc) => loginBloc.add(const LoginAttemptEvent("kelvin", "kelvin")),
      expect: () => [LoginStateLoading(), LoginStateSuccess()]);

  blocTest<LoginBloc, LoginState>("Test Login Bloc Error State - user not found",
      build: () {
        when(() => mockFloorRepository.findUser("kelvin1")).thenAnswer((_) async => null);

        return loginBloc;
      },
      act: (bloc) => loginBloc.add(const LoginAttemptEvent("kelvin1", "kelvin")),
      expect: () => [LoginStateLoading(), LoginStateError(LoginError.userNotFound)]);

  blocTest<LoginBloc, LoginState>("Test Login Bloc Error State - wrong password",
      build: () {
        when(() => mockFloorRepository.findUser("kelvin")).thenAnswer((_) async => Future.value(UserEntity(
              name: "kelvin",
              password: "kelvin",
              phoneNo: "123",
              username: "kelvin",
            )));

        return loginBloc;
      },
      act: (bloc) => loginBloc.add(const LoginAttemptEvent("kelvin", "kelvin1")),
      expect: () => [LoginStateLoading(), LoginStateError(LoginError.userWrongCredential)]);
}
