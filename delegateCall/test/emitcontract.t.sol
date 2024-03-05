// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.2;
import {Test} from "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "forge-std/console.sol";

import {EmitEventContract} from "../src/emitContract.sol";

contract EmitContractTest is Test{
    EmitEventContract  public em;
    event Transfer(address from,address to,uint amount);

    function setUp()public{
        em = new EmitEventContract();
    }

    function test_ExpectEmit()public{
        
        vm.expectEmit(true, true, false, true);
         emit Transfer(address(this), address(1337), 1337);
         em.transfer(address(1337),1337);
    }
     function test_ExpectEmit_DonotCheckData()public{
        vm.expectEmit(true, true, false, false);
         emit Transfer(address(this), address(1337), 1339);
         em.transfer(address(1337),1337);
    }

//out of test
    function test_userBalance()public{
        //set up a prank as address(1) with 10000 ETH balance
        hoax(address(1),10000 ether);
        assertEq(address(1).balance,10000 ether);
    }

}