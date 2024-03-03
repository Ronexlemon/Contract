// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.2;
import {Test} from "forge-std/Test.sol";

import {SimpleContract} from "../src/simpleContract.sol";


contract SimpleContractTest is Test{
    SimpleContract public simple;
    function setUp()public{
        simple = new SimpleContract();

    }
    function test_initialnumIsZero()public{
        assertEq(simple.num(),0);
    }
}