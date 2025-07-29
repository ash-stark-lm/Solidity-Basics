// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; //stating our version works with this or greater version ^this sign tells it

//pragma solidity >=0.8.18<0.9.0  range based
//smart contracts are non-removable once deployed

contract SimpleStorage2 {
    uint256 myfavNum;

    struct Person {
        uint256 favNum; //0 index
        string name; //1 index
    }

    Person[] public listOfPeople;

    mapping(string => uint256) public myMap;

    function addPerson(string memory _name, uint256 _favNum) public {
        listOfPeople.push(Person({favNum: _favNum, name: _name}));
        myMap[_name] = _favNum;
    }

    function store(uint256 _favNum) public {
        myfavNum = _favNum;
    }

    function retrieve() public view returns (uint256) {
        return myfavNum;
    }
}
