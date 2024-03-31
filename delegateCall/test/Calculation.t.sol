// SPDX-License-Identifier:MIT
pragma solidity ^0.8.2 ;

import {Calculation} from "../src/calculation.sol";
import {Test} from "forge-std/Test.sol";
error notOwner();

contract CalculationTest is Test{
    event IncrementNum(address indexed _caller, uint256 _value);
     event DecrementNum(address indexed _caller, uint256 _value);
    Calculation public calc;

    function setUp()public{
        calc = new Calculation();

    }


    //test for get number

    function test_getnum()public{
        uint num = calc.getNum();
        
        assertEq(num, 0);
    }
    //setNum
    function test_setnum()public{
       
         calc.setNum(15);  
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
               
        
     }

     


    




