import 'dart:io';

check(var name,var pwd){
   var username=["admin12","user10"];
   var mail=["admin123@gmail.com","user123@gmail.com"];
   var password=["1234","2233"];
   var pdt=["p1","p2","p3","p4"];
   var qty=[10,10,30,24];
   var rate=[300,499,900,360];
   var ans,cart=[],cart_qty=[],cart_rate=[];
   // ignore: dead_code
   for(int i =0;i<username.length;i++){
    if((username[i]==name ||mail[i]==name ) && password[i]==pwd){
      print("login successfull");
      
      while(true){
               print("enter 1 to show products");
               print("enter 2 to add item to cart");
               print("enter 3 to remove item from cart");
               print("enter 4 to buy the item");
               print("enter 5 to show cart items");
               print("enter 6 to logout");
               ans=int.parse(stdin.readLineSync()!);
               if(ans==1){
                product(pdt,qty,rate);
               }
               else if(ans==2){
                add_cart(pdt,qty,cart,cart_qty,cart_rate,rate);
               }
               else if(ans==3){
                remove_cart(cart,cart_qty);
               }
               else if(ans==4){
                buy_now(cart,cart_qty,cart_rate);
               }
               else if(ans==5){
                if(cart.length==0){
                  empty_cart();
                }
                else{
                print("${cart} \n ${cart_qty}");}
               }
               else if(ans==6){
                logout();
                 return;
               }
            }
     return;
    }
   }
}
empty_cart(){
    print("there are no items in cart");
    return;               
}
product(var pdt,var qty,var rate){
  print("available products are:");
  for(int i=0;i<pdt.length;i++){
    print("\t${pdt[i]}\t${qty[i]}\t${rate[i]}");
  }
  return ;
}

add_cart(var pdt_name,var qty,var cart,var cart_qty,var cart_rate,var rate){
  var pt,qt;
    print("enter the name of product");
    pt=stdin.readLineSync(); 
    for(int i =0;i<pdt_name.length;i++){
      if(pdt_name[i]==pt){
       print("enter the quantity of product");
       qt=int.parse(stdin.readLineSync()!);
       if(qty[i]>=qt){
         print("${pdt_name[i]} is available for purchase");
             cart.add(pt);
             cart_qty.add(qt);
             cart_rate.add(rate[i]);
             print("${pt} is added to cart with quantity= ${qt} ,price= ${qt*rate[i]}");
             return;
          }
        } 
      }
    }
  

remove_cart(var cart,var qty){
     var item,q;
      if(qty.length==0){
          print("no items are there in cart");
          return;
        }
    print("items in cart are: ${cart}\n${qty}");
     print("enter the item you want to remove from cart");
     item=stdin.readLineSync();
     for(int i=0;i<cart.length;i++){
      if(cart[i]==item){
        print("enter the qty of item you want to remove");
        q=int.parse(stdin.readLineSync()!);
        if(qty[i]>=q){
            if(qty[i]-q==0){
              cart.remove(item);
              qty.remove(q);
            }
            else{
              qty[i]=qty[i]-q;
            }
            print("${cart}\t ${qty}");
            return;
        }
        else{
          print("item doesn't exist in cart");
          return;
        }
      }
     }

  }
buy_now(var cart,var cart_qty,var cart_rate){
  var item,qty,t_rate,permit,pdt_buy=[],qty_buy=[],rate_buy=[];
  if(cart.length==0){
    print("please add items in cart first");
    return;
  }
  while(true){
    print("press 'a' to  buy  items from cart ");
    print("press b to proceed for final payment");
    permit=stdin.readLineSync();
    if(permit=="a"){
      print("enter the item you want to buy from cart");
      item= stdin.readLineSync();
      print("enter the quantity of item");
      qty=int.parse(stdin.readLineSync()!);
      for(int i=0;i<cart.length;i++){
         if(cart[i]==item){
           t_rate=qty*cart_rate[i];
           pdt_buy.add(item);
           qty_buy.add(qty);
           rate_buy.add(t_rate); 
          }
      } 

   }
   else if(permit=="b"){
    payment(pdt_buy,qty_buy,rate_buy);
   }
      }}
payment(var product_name,var product_qty,var total_price){
  num total_products=0,final_price=0;
  for(int i=0;i<product_name.length;i++){
      total_products+=product_qty[i];
      final_price+=total_price[i];
  }
  print("------bill------");
  for(int i=0;i<product_name.length;i++){
    print("${product_name[i]}\t${product_qty[i]}\t${total_price[i]}");
  }
  print("\t\t\t\ttotal products are:${total_products}");
  print("\t\t\t\ttotal price is:${final_price}");
  print("thanks for coming!!\nHave a good day.");
  return;
}
logout(){
  print("logout successful");
  return;
}

main(){
  var sc,name,pwd;
    while(true){
      print(" press 1. to login your account.");
      sc= int.parse(stdin.readLineSync()!);
      if(sc==1){
            print("enter email or username");
            name=stdin.readLineSync();
            print("enter pwd");
            pwd=stdin.readLineSync();
            check(name,pwd);
      }
    }
}