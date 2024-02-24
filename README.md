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

    flutter packages pub run build_runner build --delete-conflicting-outputs

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
5- module — Contains main module (view, event, state, bloc, model).
6- network — Contain Networking config.
7- utils — Contains helper class.
8- main.dart, init_app.dart, main_dev.dart, main_prod.dart - Setup env config.

### Routes

    Navigator.pushNamed({context}, {routes-name}, arguments: {arguments model})

### Flutter test code coverage screenshot

* All Test Files Success
 <img width="1384" alt="Screen Shot 2024-02-23 at 19 47 53" src="https://github.com/kelvin-learning-ecommerce/flutter-magnus-project-challenge-kelvin-prayitno/assets/129742660/1b987a3d-7ead-4a15-ae6b-3fa497fc3d60">


* Code Coverage by Percentage

<img width="775" alt="Screen Shot 2024-02-23 at 19 45 12" src="https://github.com/kelvin-learning-ecommerce/flutter-magnus-project-challenge-kelvin-prayitno/assets/129742660/a06859b1-bbb7-4dd2-9aa1-8c4896fee10c">
<img width="775" alt="Screen Shot 2024-02-23 at 19 45 25" src="https://github.com/kelvin-learning-ecommerce/flutter-magnus-project-challenge-kelvin-prayitno/assets/129742660/9073c7e6-66e5-4e75-9eeb-e4d5599d0d8b">
<img width="775" alt="Screen Shot 2024-02-23 at 19 45 30" src="https://github.com/kelvin-learning-ecommerce/flutter-magnus-project-challenge-kelvin-prayitno/assets/129742660/4a62ad6f-902c-4081-b820-55708067459a">
<img width="775" alt="Screen Shot 2024-02-23 at 19 45 46" src="https://github.com/kelvin-learning-ecommerce/flutter-magnus-project-challenge-kelvin-prayitno/assets/129742660/8b928d06-5ee5-458d-8ac9-bfce244846c2">
<img width="775" alt="Screen Shot 2024-02-23 at 19 45 59" src="https://github.com/kelvin-learning-ecommerce/flutter-magnus-project-challenge-kelvin-prayitno/assets/129742660/6ed9e3e5-6497-4487-b2e7-e0597215b64f">

