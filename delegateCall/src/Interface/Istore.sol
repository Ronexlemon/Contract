// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

interface Istore {
     struct  Person {
        string name;
        uint salary;
        uint id;
        uint tax;
        bool isMember;
        
    }
    

    function setPersonData(string calldata _name,uint _salary,uint _id,bool _isMember,uint _tax)external ;

    function getPersonData(uint _id)external view returns(Person memory);

    function getNetPay(uint _id)external view returns(uint);
    
}