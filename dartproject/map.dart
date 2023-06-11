
import 'dart:io';

List<String> username = ["user1", "user2"];
List<int> product_id = [1, 2, 3, 4, 5];
List<String> product_name = ["p1","p2","p3","p4","p5"];
List<int> qty = [10, 23, 34, 20, 30];
List<int> rate = [100, 200, 300, 400, 350];
List<int> dis= [2, 1, 3, 2, 4];
var userdata = {"user1":123,"user2":2233};
var productdata = {
  "product_id": product_id,
  "product_name": product_name,
  "qty": qty,
  "rate": rate,
  "dis":dis
};

Map<String,List> cart = {};
var values=[];
line(var name){
  print("***********$name************");
  return;
}

login(){
  line("login successfull");
  chose();
 } 
 product(){
line("product");
 for (var i in productdata.keys){
  stdout.write("$i \t");
 }
 print("");
 for (int i=0;i<product_id.length;i++){
  for (var j in productdata.values){
     stdout.write("${j[i]} \t");
  }
  print("");
  } 
  chose();
 }

 show_cart(){
  print(cart);
  chose();
 }


remove_item(Map<String,List> cart,var key,var value,var values){
   for(var u in cart.keys) {
    print(values);
    if(u==key){
      print("item is present in cart");
      if(value==key.values[1]){
        cart.remove(key);
        print('${cart}');
      }
      else if(value<key.values[1]){
        key.remove(value);
        print(cart);
      }
      else{
       print("can't remove ${value} items from cart");
      }
    }
   } 
  chose();
}

buy_product(){
   chose();
 }

show_bill(){
    chose();
}

logout(){
    chose();
}

 add_to_cart(Map<String,List> cart,var key,var value1,var value2,var value3,var value4,var values){
  values.add(value1);
  values.add(value2);
  values.add(value3);
  values.add(value4);
  cart[key]=values;
  print(cart);
  chose();
}


pro_verify(){
  print("enter the product you want to add");
  var prod_verify= stdin.readLineSync();
  for (int i=0;i<product_name.length;i++){
    for (var u in productdata.values){
    if(prod_verify==u[i]){
        print("item is  available");
        print("product_id is ${product_id[i]} and ${qty[i]}  items are available for this product.");
        print("product rate is ${rate[i]} ");
        print("enter the qty of product you want");
        var want_qty=int.parse(stdin.readLineSync()!);
        if(want_qty<=qty[i]){
          print("product added to cart \n${cart}");
          print("\np_name\t   id qty t_rs dis\n");
          add_to_cart(cart,prod_verify,product_id[i],want_qty,want_qty*rate[i],dis[i],values);
        }  
      }
    }
   }
  }


chose(){
 print("press 1. - show products");
 print("press 2. - add to cart");
 print("press 3. - remove from cart");
 print("press 4. - to show cart");
 print("press 5. - buy product");
 print("press 6. - to show bill");
 print("press 7. - to logout");
 var choose=int.parse(stdin.readLineSync()!);

switch(choose){
  case 1:
       product();
  case 2:
       pro_verify();
  case 3:
       if (cart.length==0){
         print("there are no items in cart ");
        }
      else{
       print("enter the item you want to remove from cart");
       var item = stdin.readLineSync();
       print("enter the qty of product  you want to remove from cart");
       var rem = int.parse(stdin.readLineSync()!);
       remove_item(cart,item,rem,values);}
  case 4:
       show_cart();
  case 5:
       buy_product();
  case 6:
       show_bill();
  case 7:
       line("logout successfull");
       return;
 }
}


void main(){
print("enter key for login");
  String key = stdin.readLineSync()!;
  for (var u in userdata.keys){
    if (key == u) {
       print("user login");
       login();
       break;
       }
      else{
         line("login failed");
    }
  }
}
 

