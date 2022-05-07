import 'package:dart_basics_1/dart_basics_1.dart' as dart_basics_1;

void main() {
  List<String> otherAdmins = ["dfjsdksd@gmail.com", "janpawel2@yahoo.vatican"];
  List<String> otherAdmins2 = [
    "kondonowicz@gmail.com",
    "janpawel3@yahoo.vatican"
  ];

  var user = {
    "username": "janfac@gmail.com",
    "admin": false,
  };

  var admin = [
    "guwwno@gmail.com",
    "kdosd@gmail.com",
    "jdjdjd@gmail.com",
    if (user["admin"] as bool) user['username'],
    for (var admin in otherAdmins) admin,
    ...otherAdmins2,
  ];

  print(admin);

  var collection1 = [23, 43, 53, 34];
  var collection2 = [...collection1]; // COPY OF COLLECTION1

  collection2[0] = 0;

  print(collection1);
  print(collection2);
}
