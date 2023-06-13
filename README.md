# 99Group Flutter Coding Challenge

## Getting Started

# flutter sdk information

flutter used for develop is v3.10.0

## How to Use

To generate key (only needed to release to Play Store):

    cd android/app/
    keytool -genkey -alias 99groupAlias -keyalg RSA -keystore keystore.jks -dname "CN=99group Coding Challenge, OU=99group Coding Challenge, O=99group, L=Jakarta, S=Jakarta, C=ID" -storepass 99groupKeystorePass -keypass 99groupKeystorePass -deststoretype pkcs12 -keysize 4096 -validity 20000

create `key.properties` in the android root path:

    keyAlias=CHANGE_ME
    keyPassword=CHANGE_ME
    storeFile=keystore.jks
    storePassword=CHANGE_ME

to generate localization, please use

     flutter pub run intl_utils:generate

This project uses `inject` library and auto serialize models that works with code generation,
execute the following command to generate files:

    flutter packages pub run build_runner build --delete-conflicting-outputs

to update app icon

    flutter pub run flutter_launcher_icons:main

to run flutter test

    flutter test

to run flutter integration test

    flutter drive --driver=test_driver/integration_test.dart --target=integration_test/main_test.dart --flavor production

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

* Game List
* Game Details
* Locale

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Bloc](https://pub.dev/packages/flutter_bloc)
* [Encryption](https://github.com/xxtea/xxtea-dart)
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
|- DI/
|- generated/
|- li0n/
|- module/
|- network/
|- utils/
|- init_app.dart
|- main.dart
|- main_dev.dart
|- main_prod.dart

Now, lets dive into the lib folder which has the main code for the application.

1- config - Contain env data, navigator & routes config, provider list for bloc classes, url const.
2- DI - Contains dependency config.
3- generated - Contain generated localization.
4- li0n — Contain localized wording.
5- umodule — Contains main module (view, event, state, bloc, model).
6- network — Contain Networking config.
7- utils — Contains helper class.
8- main.dart, init_app.dart, main_dev.dart, main_prod.dart - Setup env config.

### Codemagic info
    email: 99group.coding.challenge@gmail.com
    password: 99Gpass!23

    triggered on new tag creation
    watched tag pattern:
    *.prod
    *-prod
    *-build
    *.build

### Routes

    Navigator.pushNamed({context}, {routes-name}, arguments: {arguments model})
