
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
}