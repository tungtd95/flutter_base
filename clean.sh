set -x

rm -rf build
flutter clean
rm pubspec.lock
flutter pub get