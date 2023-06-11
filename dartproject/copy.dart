import 'dart:io';

List<String> username = ["user1", "user2"];
List<int> product_id = [1, 2, 3, 4, 5];
List<String> product_name = [
  "product1",
  "product2",
  "product3",
  "product4",
  "product5"
];
List<int> qty = [10, 23, 34, 20, 30];
List<int> rate = [100, 200, 300, 400, 350];

var userdata = {};
var productdata = {
  "product_id": product_id,
  "product_name": product_name,
  "qty": qty,
  "rate": rate,
  "dis": [2, 1, 3, 2, 4],
  "cart":[{"pro_id":{},"qty":{}}]
};
Product() {
  print("****** product******");
  var n = productdata['product_id'];
  print(n);

  for (var i = 0; i < product_id.length; i++) {
    if (i == 0) {
      for (var key in productdata.keys) {
        stdout.write(key);
        stdout.write("\t");
      }
      print("");
    }

    for (var key in productdata.keys) {
      //print(key);
      stdout.write(productdata[key]?[i]);
      stdout.write("\t");
    }
    print("");
  }
}

/* 
p_id p_name     qty   rate
 1    product1   23   200
 1    product1   23   200 */
Login() {
  print("********* login ************");
  print("enter name");
  String name = stdin.readLineSync()!;
  for (var u in userdata.keys) {
    if ("user" == u) {
      for (var udata in userdata[u]) {
        print("$name=>$udata ");
        if (name == udata) {
          print(" user login");
          Product();
        }
      }
    }
  }
}

void Register() {
  print("enter key for login");
  String key = stdin.readLineSync()!;

  userdata[key] = username;
  print("enter user name");
  String name = stdin.readLineSync()!;
  for (var u in userdata.keys) {
    if (key == u) {
      for (var udata in userdata[u]) {
        if (name == udata) {
          print(" user login ");
          Login();
          // break;
        } else {
          username.add(name);

          userdata[key] = username;
          print(userdata);
          Login();
        }
      }
    }
  }
}

void main() {
  while (true) {
    Register();
  }
  //print(username);

  /*  var map1 = {"id": 100, "name": "user", "age": 30};
  print(map1);
  print(map1["id"]);

  var user = {"user": "user1"}; */
  /*  print("enter name"); */
  // var name = stdin.readLineSync();
  /*  if (name == user['user']) {
    print("login");
  } */

  /*  userdata["user"] = username;
  for (var u in userdata.keys) {
    if ("user" == u) {
      for (var udata in userdata[u]) {
        if (name == udata) {
          print("login");
          break;
        }
      }
    } */
  /* if (name == u) {
      print("login");
      break;
    } */
  // }
}