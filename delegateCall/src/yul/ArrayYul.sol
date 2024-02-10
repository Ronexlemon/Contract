// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract YulStorageComplex{
    uint256[3] fixedSizeArray;

    uint256[] dynamicArray;

    uint8[] smallArray; //2 ^ 8 

    constructor(){
        fixedSizeArray =[66,77,88];
        dynamicArray = [9,909,890,340,670];
        smallArray =[8,88,45];
    }

    function getValueFixedArray(uint _index)external  view returns(uint value){
        assembly{
            value := sload(add(fixedSizeArray.slot,_index))
        }
    }

    function getValueFixedArraylength()external  view returns(uint length){
        assembly{
            length := sload(fixedSizeArray.slot)
        }
    }

    function getValueDynamicArraylength()external  view returns(uint length){
        assembly{
            length := sload(dynamicArray.slot)
        }
    }

    function getDyamicArrayValue(uint256 _index)external  view returns(uint value){
        uint256 arraySlot;
        assembly{
            arraySlot := dynamicArray.slot
        }
        bytes32 dataStartSlot = keccak256(abi.encode(arraySlot));
        assembly{
            value := sload(add(dataStartSlot ,_index))
        }
    }

    function getSMallArrayValue(uint256 _index)external  view returns(bytes32 value){
        uint256 arraySlot;
        assembly{
            arraySlot := smallArray.slot
        }
        bytes32 dataStartSlot = keccak256(abi.encode(arraySlot));
        assembly{
            value := sload(add(dataStartSlot ,_index))
        }
    }

    }