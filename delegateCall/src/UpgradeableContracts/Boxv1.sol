//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract BoxV1{
    uint256 internal number;
    function getNumber()public view returns(uint256){
        return number;
    }

    function version()public pure returns(uint256){
        return 1;
    }
    function setNumber(uint256 _number)public{
        number = _number;
    }
}