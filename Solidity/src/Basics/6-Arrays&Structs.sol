// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; //stating our version works with this or greater version ^this sign tells it
//pragma solidity >=0.8.18<0.9.0  range based
 //smart contracts are non-removable once deployed

 //similar to class here we have contract
contract SimpleStorage{
    uint256 myfavNum;

    //uint256[] listOfFavNum;
    struct Person{
        uint256 favNum;//0 index
        string name;//1 index
    }
   
   //Person public myFriend=Person(7,"Nick");
    /*Person public Nick=Person({favNum:7,name:"Nick"});
    Person public John=Person({favNum:7,name:"John"});
    Person public Tony=Person({favNum:7,name:"Tony"});
    */
    //So instead of repeating this code again and again what we can use is array

   //Static array
   // Person[3] public listOfPeople;
    //dynamic array
    Person[] public listOfPeople;

    function addPerson(string memory _name, uint256 _favNum ) public{
        listOfPeople.push(Person({favNum:_favNum,name:_name}));
       /*
        Person memory newPerson= Person ({favNum:_favNum,name:_name});
        listOfPeople.push(newPerson);
        */
    }

   function store(uint256 _favNum)public{
    myfavNum=_favNum;
   }
   function retrieve() public view returns(uint256){
    return myfavNum;
   }
   
}




