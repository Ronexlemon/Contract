// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.2;

import {Test, console2} from "forge-std/Test.sol";

import {A,B,C,D} from "../src/DelegateCall.sol";
//import {Stake} from "../src/libraries/MyLibraries.sol";

contract DelegateCallTest is Test {
    
    A public contractA;
    B public contractB;
    C public contractC;
    // D public contractD;
    // Stake public contractStake;

    function setUp() public {
        
        
        contractA = new A();
        contractB = new B();
        contractC = new C();
       
        // contractD = new D();

    }

    function test_SetValue()public{
        contractA.setValue(address(contractB),10);
        
        assertEq(contractA.val(),10);
    }

    function test_DouleSetValue()public{
        contractA.setValue(address(contractC),20);
        assertEq(contractA.val(),40);
    }


    
}
