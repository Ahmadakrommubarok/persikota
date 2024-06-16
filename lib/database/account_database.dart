import 'package:persikota/shared/util/core_package.dart';

class AccountDatabase {
  static String? email = "";

  static load() async {
    var data = mainStorage.get("emailAccount");

    if (data != null && data is String) {
      email = data;
    } else {
      email = "";
    }
  }

  static save(String? email) async {
    mainStorage.put("emailAccount", email);
    AccountDatabase.email = email ?? "";
  }
}
