// SPDX-License-Identifier:MIT
pragma solidity ^0.8.2 ;

contract Calculation{
    uint public num;
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"not owner");
        _;
    }

    //setNum
    function setNum(uint _num)public onlyOwner{

    }

    //increment
    function increment()public{
        num ++;
    }

    //decrement
    function decrement()public{
        num --;
    }

    //getNum
    function getNum()public view returns(uint){
        return num;
    }
}