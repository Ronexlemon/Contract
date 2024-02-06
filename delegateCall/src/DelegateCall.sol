// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import {Math} from "./libraries/Multiplication.sol";

contract B{
    uint256 val;
    address public  sender;

    function setValue(uint256 _val)public{
        val =_val;
        sender = msg.sender;

    }
    function getVal()public view returns(uint256){
        return val;
    }
}

contract C{
    uint256 val;
    address public  sender;
    using Math for uint256;

    function setValue(uint256 _val)public{
        val =Math.Double(_val,2);
        sender = msg.sender;

    }
    function getVal()public view returns(uint256){
        return val;
    }
}


contract A {
    uint256 public  val;
    address public  sender;
    bytes public  _data;
    

    function setValue(address _contract,uint256 _val)public{
        (bool success, bytes memory data) = _contract.delegatecall(abi.encodeWithSignature("setValue(uint256)", _val));
        _data =data;

        require(success,"failedto delegate call");
    }

}