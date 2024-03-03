// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.2;
import {Test} from "forge-std/Test.sol";

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

}