import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/entity/user_entity.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/floor_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/bloc/register_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/events/register_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/states/register_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/splashscreen/bloc/splash_screen_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/splashscreen/events/splash_screen_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/splashscreen/states/splash_screen_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/register_error_enum.dart';
import 'package:mocktail/mocktail.dart';

class MockFloorRepository extends Mock implements FloorRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

void main() {
  late MockFloorRepository mockFloorRepository;
  late MockStorageRepository mockStorageRepository;
  late SplashScreenBloc splashScreenBloc;

  setUp(() async {
    mockFloorRepository = MockFloorRepository();
    mockStorageRepository = MockStorageRepository();
    splashScreenBloc = SplashScreenBloc(mockStorageRepository, mockFloorRepository);
  });

  blocTest<SplashScreenBloc, SplashScreenState>("Test Splash Screen Bloc Success State",
      build: () {
        when(() => mockStorageRepository.getIsLogin()).thenAnswer((_) async => Future.value(true));

        return splashScreenBloc;
      },
      act: (bloc) {
        splashScreenBloc.add(const SplashScreenNextPageEvent());
      },
      expect: () => [SplashScreenStateInit(), SplashScreenStateSuccess(true)]);
}
