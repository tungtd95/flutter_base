# Weather App - Flutter base
##  Technologies
* SDK: Dart + Flutter 2
* Architecture: Bloc + Repository
* Libraries: getIt, injectable, retrofit, floor, rxdart, json serializable, firebase, flutter_local_notifications, flutter_alice...
## Config environment before build
This project include 2 environment configuration: **dev** for development and **prod** for production. Those environments differ by app name, package id, firebase configuration and every thing in `lib/env_config.dart`
### Android
- **dev**: append `--dart-define=Env=dev --flavor dev` to your build command
- **prod**: append `--dart-define=Env=prod --flavor prod` to your build command
> Note:
> * `--dart-define=Env=dev` for flutter env and  `--flavor dev` for Android gradle flavor
> * You can config your own Android flavor values in `android/app/build.gradle`
### iOS
Because of lacking flavor for iOS, we use [Natrium](https://cocoapods.org/pods/Natrium) as a tools for flavor configuration.
- **dev**:
  -- run this command: `bash config_ios.sh dev`
  -- append: `--dart-define=Env=dev` to your build command
  -- build
- **prod**:
  -- run: `bash config_ios.sh prod`
  -- append: `--dart-define=Env=prod` to your build command
  -- build
> Note:
>* The script `config_ios.sh` is wrapped for Natrium, it only required for the first time you build each environment.
>* What Natrium does is replacing app name, package id, firebase config, icon... in `ios/Runner` with each environment you define.
>* You can config your own ios flavor values in `ios/.natrium.yml`
