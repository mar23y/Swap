// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./token.sol";
 

contract swapeth{


 Token public token;

 uint public  rate = 100;

 string tokenname = "SMTOKEN";

 address payable  owner;

 event buy(

 address token,

 uint rate,

 uint tokenamount

 );

 event sell(

 address msgsender,   

 address token,

 uint _value,

 uint rate


 );



 constructor( Token _token , address owner)  {

 token = _token;

 owner = msg.sender;


  }

 function buysmtoken( uint value) public payable{

 uint tokenamount = value * rate;

 require(token.save(address(this))>=tokenamount);

 token.transfer( msg.sender , tokenamount);

 emit buy (address(token) , rate , tokenamount);

  }
 
 function selleth(uint _value) public   {

 uint _tokenamount = _value / rate;   

 require(token.save(msg.sender)>=_value);

 require(token.save(address(this))>=_tokenamount);

 token.transferfrom(msg.sender , address(this) , _value);

 owner.transfer( _tokenamount);

 emit sell(msg.sender , address(token) , _value  , rate);


 }






 }