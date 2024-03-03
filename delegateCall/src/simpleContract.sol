// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract SimpleContract{
    uint public  num;

    function setNum(uint _num)public{
        num= _num;
    }

    function getNum()public view returns(uint ){
        return num;
    }
}
