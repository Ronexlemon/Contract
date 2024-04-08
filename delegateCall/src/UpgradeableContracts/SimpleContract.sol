// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
// import "@openzeppelin/contracts/proxy/Proxy.sol";
import  "@openzeppelin/contracts/proxy/Proxy.sol";

contract SimpleContract is Proxy{

    bytes32 private constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
 //keccak256("IMPLEMENTATIO_CONTRACT");
    // bytes32 private num = 0x9cb2b1856e39539d575ad67b16f045c642dfb3f93fc75cbb9608cc08f3c36f5c;

    function returnBytes()public view  returns(address){
        
        return  _implementation() ;
    }

    function setImplementation(address implementation)public{
        assembly{
            sstore(_IMPLEMENTATION_SLOT,implementation)
        }
    }

    function _implementation()internal view override  returns(address implementation){
        assembly{
            implementation := sload(_IMPLEMENTATION_SLOT)

        }
    }

    //helper function

    function getDataToTransact(uint256 newValueToUpdate)public pure  returns(bytes memory){
        return  abi.encodeWithSignature("setValue(uint256)", newValueToUpdate);
    }

    function readStorage()public view returns (uint256 valueAtstorageSlotZero){
        assembly{
            valueAtstorageSlotZero := sload(0)

        }

    }
}

//smallproxy -> implementationA
contract implementationA{
    uint256 public value;

    function setValue(uint256 newValue)public{
        value = newValue;
    }
}

contract implementationB{
    uint256 public value;

    function setValue(uint256 newValue)public{
        value = newValue +2;
    }
}