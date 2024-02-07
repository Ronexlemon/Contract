// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import {Istore} from "./Interface/Istore.sol";
import {CalNetPay} from "./libraries/MyLibraries.sol";

contract Store is Istore{
    using CalNetPay for uint;
    mapping(uint => Person) public persons;

    function setPersonData(string calldata _name,uint _salary,uint _id,bool _isMember,uint _tax)public override{
        persons[_id] = Person({name: _name,salary:_salary,id: _id,isMember:_isMember,tax: _tax});

    }
     function getPersonData(uint _id)public view override returns(Person memory){
        return persons[_id];
     }

     function getNetPay(uint _id)public view override returns(uint){
        Person storage person = persons[_id];
        uint netpay =  CalNetPay.NetPay(person.salary,person.tax);
        return netpay;
     }
   


}