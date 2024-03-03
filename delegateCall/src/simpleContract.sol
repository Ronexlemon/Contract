// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
error Unauthorized();
contract SimpleContract{
    uint public  num;
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    function setNum(uint _num)public{
        if(msg.sender != owner){
            revert Unauthorized();
        }
        num= _num;
    }

    function getNum()public view returns(uint ){
        return num;
    }
}
