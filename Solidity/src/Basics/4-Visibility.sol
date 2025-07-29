// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; //stating our version works with this or greater version ^this sign tells it
//pragma solidity >=0.8.18<0.9.0  range based

//public it is visible publicly anywhere and anyone can use it 

//private-> can be used internally within the contract
contract visibility{
    uint256 private myPrivateVar;

    function myPrivateFunction() private{

    }
}


 


