// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract B {
//Note  storage layout must be the same

uint256 public num;
address public sender;
uint256 public value;

//function to set value

function setVar(uint256 _num)public payable {
    num =_num;
    value = msg.value;
    sender = msg.sender;

}


}

contract A{
    uint256 public num;
address public sender;
uint256 public value;

event emitData(bool isSuccess,bytes  _data);

function setVar(address _contract,uint _num)public{
    (bool success,bytes memory data)= _contract.delegatecall(abi.encodeWithSignature("setVar(uint256)", _num));
    emit emitData(success, data);

}



}