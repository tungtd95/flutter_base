import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class CoreRepo {
  Future<String> getRemoteFlavor() async {
    String remoteFlavor = "not found";
    await FirebaseFirestore.instance.doc("config/1").get().then((value) {
      remoteFlavor = value.data()?["env"] ?? '';
    });
    return remoteFlavor;
  }
}