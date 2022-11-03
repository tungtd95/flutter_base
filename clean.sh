set -x

rm -rf build
flutter clean
rm pubspec.lock
flutter pub get

cd flutter_base_config
rm -rf build
flutter clean
rm pubspec.lock
flutter pub get
cd ..

cd flutter_base_core_module_1
rm -rf build
flutter clean
rm pubspec.lock
flutter pub get
cd ..

cd flutter_base_module_1
rm -rf build
flutter clean
rm pubspec.lock
flutter pub get
cd ..
