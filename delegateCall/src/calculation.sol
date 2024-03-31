// SPDX-License-Identifier:MIT
pragma solidity ^0.8.2 ;

error notOwner();

contract Calculation{
    event IncrementNum(address _caller, uint256 _value);
     event DecrementNum(address _caller, uint256 _value);
    uint public num;
  
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        if(msg.sender != owner){
            revert notOwner();
        }
        _;
    }

    //setNum
    function setNum(uint _num)public onlyOwner{
        num=_num;

    }

    //increment
    function increment()public{
        num ++;
        emit IncrementNum(msg.sender, num);
    }

    //decrement
    function decrement()public{
        num --;
        emit DecrementNum(msg.sender, num);
    }

    //getNum
    function getNum()public view returns(uint){
        return num;
    }
}