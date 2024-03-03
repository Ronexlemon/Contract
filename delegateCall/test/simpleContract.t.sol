// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.2;
import {Test} from "forge-std/Test.sol";

import {SimpleContract} from "../src/simpleContract.sol";

 error Unauthorized();

contract SimpleContractTest is Test{
    SimpleContract public simple;
   
    function setUp()public{
        simple = new SimpleContract();

    }
    function test_initialnumIsZero()public{
        assertEq(simple.num(),0);
        simple.setNum(4);
        assertEq(simple.num(),4);


    }

    function testFail_setNotOwner()public{
        vm.prank(address(0));
        simple.setNum(5);

    }

    function test_Revert_when_CallnotTheOwner()public{
        vm.expectRevert(Unauthorized.selector);
        vm.prank(address(0));
        simple.setNum(4);
    }
}