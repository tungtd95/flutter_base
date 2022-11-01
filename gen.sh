set -x

cd flutter_base_config
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
cd ..

cd flutter_base_core_module_1
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
cd ..

cd flutter_base_module_1
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
cd ..

flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
