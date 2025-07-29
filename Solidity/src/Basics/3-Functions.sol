// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//contracts are like class in C++
contract BasicsDemo {

  //basic structure of a function is
  
  /*function fn_name() visibility pure/view returns(return type){  
  }*/
  //e.g
  uint res=0;
  function add(uint256 num) public{
    res+=num;
  }
  function subtract(uint256 num) public{
    res-=num;
  }
  function multiply(uint256 num) public{
    res*=num;
  }
  function divide(uint256 num) public{
    res/=num;
  }
  //view means 

  function get() public view returns (uint256){
    return  res;
  }
    
}
