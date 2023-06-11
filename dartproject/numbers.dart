//void main(){      //similar to C language
//print("hello");  //not printf use print 
//int n1=9;
//int n2=7;
//int r=n1+n2;//arith assi conditional incr decr
//print("result=${r}");         //variable : ${variable}
//double div= n1 / n2;
//print("divide is:${div}");
//print(n1 | n2 is  String);

//count integer and its sum
/*int n1=232546;
int count=0;
int s=0;
int num=n1;
while(num!=0){
  s+=num%10;
  count+=1;
  num=num ~/ 10 ;
 
}
print(count);
print(s);


//even to another  var, sum
int s1=0,even;
int num1=n1;

while(num1!=0){
  num=num~/10;
  even=num1%10;
  if(even%2==0){
  s1+=even;}
  
  print(s1);
}
print(s1);
}*/
//12323456



import 'dart:io';
void main(){
  void add(var L,var L2){
    L2.addAll(L);
    return;
  }
  var num =12323456;
   var list=[];
   for(int i=0;i<8;i++){
        list.add(num%10);
        num=num~/10;
   }
   print(list);
  for(int i =0;i<list.length/2;i++){
    var temp= list[i];
    list[i]=list[list.length-1-i];
    list[list.length-1-i]= temp;
  }
  print(list);

  //even and odd list
   var even=[];
  var odd=[];
   for (int i =0;i<list.length;i++){
    if(list[i]%2==0){
      even.add(list[i]);
    }
    else{
      odd.add(list[i]);
    }
   }
   print(even);
   print(odd);
   
   //combine even and odd list
   var list2=[];
   add(even,list2);
   add(odd,list2);
   print(list2);

   //login
   
}

