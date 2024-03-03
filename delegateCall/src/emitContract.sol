// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract EmitEventContract{
    event Transfer(address from,address to,uint amount);

    function transfer(address _to,uint _amount)public{
        emit Transfer(address(this), _to, _amount);

    }
}