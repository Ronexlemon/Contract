// SPDX-License-Identifier:MIT
pragma solidity ^0.8.2 ;

import {Calculation} from "../src/calculation.sol";
import {Test,console} from "forge-std/Test.sol";
import {CalculationScript} from "../script/DeployCalculation.s.sol";
error notOwner();

contract CalculationTest is Test{
    event IncrementNum(address indexed _caller, uint256 _value);
     event DecrementNum(address indexed _caller, uint256 _value);
    Calculation public calc;

    function setUp()public{
        
        CalculationScript calcScript = new CalculationScript();
        calc = calcScript.run();

    }


    //test for get number

    function test_getnum()public{
        uint num = calc.getNum();
        
        assertEq(num, 0);
    }
    //setNum
    function test_setnum()public{
        console.log("address new is ",address(new CalculationScript().run()));
        console.log("address this", address(this));
        vm.prank(msg.sender);
       
         calc.setNum(15);  
         console.log("The num is",calc.num());
        assertEq(calc.num(), 15);
    }

    //suppose to fail when not owner
     function testFail_When_CallerNotOwner_setnum()public{
        
       vm.prank(address(0));
         calc.setNum(15);  
        assertEq(calc.num(), 15);
    }

    //test increment emit

    function test_incrementEmit()public{

        vm.expectEmit(true, false, false, true);
        emit IncrementNum(address(this), 1);
        calc.increment();

    }

    //check the owner if it the sender

    function test_ifOwnerIsMsender()public{
        console.log("contract owner is",calc.owner());
        
        assertEq(calc.owner(),msg.sender);
        
    }
               
        
     }

     


    




