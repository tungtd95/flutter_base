# Weather App - Flutter base
##  Technologies
* SDK: Dart + Flutter 2
* Architecture: Bloc + Repository
* Libraries: getIt, injectable, retrofit, floor, rxdart, json serializable, firebase, flutter_local_notifications, flutter_alice...
## Config environment before build
This project include 2 environment configuration: **dev** for development and **prod** for production. Those environments differ by app name, package id, firebase configuration and every thing in `lib/env_config.dart`
### Build Config
- **dev**: append `--dart-define=Env=dev --flavor dev` to your build command
- **prod**: append `--dart-define=Env=prod --flavor prod` to your build command
> Note:
> * `--dart-define=Env=dev` for flutter env and  `--flavor dev` for Android/iOS flavor
