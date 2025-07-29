// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//contracts are like class in C++
contract BasicsDemo {
    
    /*
     ───────────────────────────────
     🔐 VISIBILITY KEYWORDS
     - public: accessible everywhere   -->like public access modifier in c++
     - private: only inside this contract --> -->like private access modifier in c++
     - internal: inside this contract + derived contracts (child contracts)--> -->like protected access modifier in c++
     - external: only callable from outside
     ───────────────────────────────
    */

    //  Integer types
    uint public age = 25;             // unsigned integer (positive only)
    int public temperature = -10;     // signed integer
    //now by default uint means uint 256 but we have uint8, uint16, uint32, uint64, uint 128 also

    //  Boolean
    bool public isActive = true;

    //  String
    string public name = "Alice";

    //  Address
    address public wallet = 0x0000000000000000000000000000000000000000;

    // Bytes (fixed size)
    bytes1 public aByte = 0x01; //1 byte->8 bits
    bytes32 public longBytes = "Hello";

    
}
