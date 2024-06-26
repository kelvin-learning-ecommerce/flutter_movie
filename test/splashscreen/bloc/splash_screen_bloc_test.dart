import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/splashscreen/bloc/splash_screen_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/splashscreen/events/splash_screen_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/splashscreen/states/splash_screen_state.dart';
import 'package:mocktail/mocktail.dart';

class MockStorageRepository extends Mock implements StorageRepository {}

void main() {
  late MockStorageRepository mockStorageRepository;
  late SplashScreenBloc splashScreenBloc;

  setUp(() async {
    mockStorageRepository = MockStorageRepository();
    splashScreenBloc = SplashScreenBloc(mockStorageRepository);
  });

  blocTest<SplashScreenBloc, SplashScreenState>("Test Splash Screen Bloc Success State",
      build: () {
        when(() => mockStorageRepository.getIsLogin()).thenAnswer((_) async => Future.value(true));

        return splashScreenBloc;
      },
      act: (bloc) {
        splashScreenBloc.add(const SplashScreenNextPageEvent());
      },
      expect: () => [SplashScreenStateInit(), SplashScreenStateSuccess()]);
}
