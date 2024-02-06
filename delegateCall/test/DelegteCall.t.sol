// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.2;

import {Test, console2} from "forge-std/Test.sol";

import {A,B} from "../src/DelegateCall.sol";

contract DelegateCallTest is Test {
    
    A public contractA;
    B public contractB;

    function setUp() public {
        
        
        contractA = new A();
        contractB = new B();
    }

    function test_SetValue()public{
        contractA.setValue(address(contractB),10);
        
        assertEq(contractA.val(),10);
    }


    
}
