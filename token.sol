// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Token{

 string name = "SMTOKEN";

 string symbole = "SMA";

 uint supply = 1000000000000000000;

 uint dicimal = 18;


 event Transfer(

 address indexed  from,

 address indexed to,

 uint value

 );


 event proval(

 address indexed from,

 address indexed spender,

 uint value

 );

 constructor()  {

 save[msg.sender] = supply;

 }

 mapping(address=>uint)  public save;

 mapping(address=>mapping(address=>uint))  public allow;

 function transfer( address to , uint value) public returns(bool success) {

 require(save[msg.sender]>= value);

 save[msg.sender] -= value;

 save[to] += value;

 emit Transfer( msg.sender , to , value);

 return true;

 } 

 function prove( address spender , uint value ) public returns(bool success){

 allow[msg.sender][spender] = value;

 emit proval ( msg.sender , spender , value );

 return true;

 }


 function transferfrom(address from  , address to , uint value) public returns(bool success){

 require(save[from]>= value);

 require(allow[from][msg.sender]>= value);

 save[from] -= value;

 allow[from][msg.sender] -= value;

 save[to] += value;

 emit Transfer(msg.sender , to , value);

 return true;



 }


 }