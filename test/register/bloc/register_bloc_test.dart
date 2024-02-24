
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/entity/user_entity.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/floor_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/bloc/register_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/events/register_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/states/register_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/register_error_enum.dart';
import 'package:mocktail/mocktail.dart';

class MockFloorRepository extends Mock implements FloorRepository {}

void main() {
  late MockFloorRepository mockFloorRepository;
  late RegisterBloc registerBloc;

  setUp(() async {
    mockFloorRepository = MockFloorRepository();
    registerBloc = RegisterBloc(mockFloorRepository);
  });

  var userEntity = UserEntity(
    name: "kelvin",
    password: "kelvin",
    phoneNo: "123",
    username: "kelvin",
  );

  blocTest<RegisterBloc, RegisterState>("Test Register Bloc Success State",
      build: () {
        when(() => mockFloorRepository.findUser("kelvin")).thenAnswer((_) async => null);

        return registerBloc;
      },
      act: (bloc) => registerBloc.add(const RegisterAttemptEvent("kelvin", "kelvin", "kelvin", "123")),
      expect: () => [RegisterStateInit(), RegisterStateSuccess()]);

  blocTest<RegisterBloc, RegisterState>("Test Register Bloc Error State - Username exist",
      build: () {
        when(() => mockFloorRepository.findUser("kelvin")).thenAnswer((_) async => userEntity);

        return registerBloc;
      },
      act: (bloc) => registerBloc.add(const RegisterAttemptEvent("kelvin", "kelvin", "kelvin", "123")),
      expect: () => [RegisterStateInit(), RegisterStateError(RegisterError.usernameFoundError)]);

  blocTest<RegisterBloc, RegisterState>("Test Register Bloc Error State - Name field empty",
      build: () => registerBloc,
      act: (bloc) => registerBloc.add(const RegisterAttemptEvent("", "", "", "")),
      expect: () => [RegisterStateInit(), RegisterStateError(RegisterError.nameError)]);

  blocTest<RegisterBloc, RegisterState>("Test Register Bloc Error State - Phone No field empty",
      build: () => registerBloc,
      act: (bloc) => registerBloc.add(const RegisterAttemptEvent("", "", "kelvin", "")),
      expect: () => [RegisterStateInit(), RegisterStateError(RegisterError.phoneNoError)]);

  blocTest<RegisterBloc, RegisterState>("Test Register Bloc Error State - Username field empty",
      build: () => registerBloc,
      act: (bloc) => registerBloc.add(const RegisterAttemptEvent("", "", "kelvin", "123")),
      expect: () => [RegisterStateInit(), RegisterStateError(RegisterError.usernameError)]);

  blocTest<RegisterBloc, RegisterState>("Test Register Bloc Error State - Username field empty",
      build: () => registerBloc,
      act: (bloc) => registerBloc.add(const RegisterAttemptEvent("", "kelvin", "kelvin", "123")),
      expect: () => [RegisterStateInit(), RegisterStateError(RegisterError.passwordError)]);
}
