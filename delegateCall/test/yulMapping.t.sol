
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


import {Test} from "forge-std/Test.sol";

import {YulMapping} from  "../src/yul/YulMapping.sol";

contract YulMappingTest is Test{

    YulMapping public yulMappingContract;

    function setUp()public{
        yulMappingContract = new YulMapping();
    }

    function test_SimpleMappingValue()public{
        uint256 value = yulMappingContract.getMappingValue(88);
        assertEq(value, 1);
    }

    function test_NestedMappingValue()public{
        uint256 value = yulMappingContract.getNestedMappingValue(9,8);
        assertEq(value, 7);
    }

    function test_getLengthOfMappingDynamicArray()public{
        uint256 value = yulMappingContract.getAddressMappinArrayLength(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        assertEq(value, 3);
    }

    function test_firstElementInMappingDynamicArray()public{
        uint256 value = yulMappingContract.getAddressMappinArrayValue(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,0);
        assertEq(value,55);
    }

    
}