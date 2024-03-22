# Magnus Project Challenge by Kelvin Prayitno

## Getting Started

# flutter sdk information

flutter used for develop is v3.10.0

## How to Use

To generate key (only needed to release to Play Store):

    cd android/app/
    keytool -genkey -alias 99groupAlias -keyalg RSA -keystore keystore.jks -dname "CN=Magnus Coding Challenge, OU=Magnus Coding Challenge, O=Magnus, L=Jakarta, S=Jakarta, C=ID" -storepass keystorePass -keypass keystorePass -deststoretype pkcs12 -keysize 4096 -validity 20000

create `key.properties` in the android root path:

    keyAlias=CHANGE_ME
    keyPassword=CHANGE_ME
    storeFile=keystore.jks
    storePassword=CHANGE_ME

to generate localization, please use

     flutter pub run intl_utils:generate

This project uses `inject` library and auto serialize models that works with code generation,
execute the following command to generate files:

    flutter packages pub run build_runner watch --delete-conflicting-outputs

to update app icon

    flutter pub run flutter_launcher_icons:main

to run flutter test & generate 

    flutter test --coverage

to check Code Coverage 

    flutter pub global run test_cov_console

## Run

Via Terminal:

### Android & iOS

    flutter run -t lib/main_dev.dart --flavor development --debug
    flutter run -t lib/main_prod.dart --flavor production --debug


## Releasing

### Android

Development flavor (App Bundle):

    flutter build appbundle -t lib/main_dev.dart --flavor development --release

Production flavor (App Bundle):

    flutter build appbundle -t lib/main_prod.dart --flavor production --release

### iOS

Development flavor (App Archive):

    flutter build ipa -t lib/main_dev.dart --flavor development --release

Production flavor (App Archive):

    flutter build ipa -t lib/main_prod.dart --flavor production --release


## Modules:

* Splash Screen
* Login
* Register
* Home
* News List
* News Detail
* Profile

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Bloc](https://pub.dev/packages/flutter_bloc)
* [Json Serialization](https://github.com/dart-lang/json_serializable)
* [Dependency Injection](https://github.com/fluttercommunity/get_it)

### Folder Structure
Here is the core folder structure which flutter provides.

flutter-app/
|- android
|- build
|- ios
|- lib
|- test

Here is the folder structure we have been using in this project

lib/
|- config/
|- data/
|- domain/
|- features/
|- generated/
|- l10n/
|- utils/
|- init_app.dart
|- main.dart
|- main_dev.dart
|- main_prod.dart

Now, lets dive into the lib folder which has the main code for the application.

1- config - Contain global config.
2- data - Contains data layer repository.
3- domain - Contain models & domain layer repository.
4- features — Contain ui, state, event, bloc for UI layer.
5- generated — Contain generated localization.
6- l10n — Contain localization.
7- utils — Contains helper class.
8- main.dart, init_app.dart, main_dev.dart, main_prod.dart - Setup env config.

### Routes

    Navigator.pushNamed({context}, {routes-name}, arguments: {arguments model})

### Flutter test code coverage screenshot
