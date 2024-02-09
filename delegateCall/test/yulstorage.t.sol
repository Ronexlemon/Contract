// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Test} from "forge-std/Test.sol";

import {YulStorage2} from "../src/yul/yulStorage.sol";

contract YulStorage2Test is Test{
    YulStorage2 public contractYulstorage2;

    function setUp()public{
        contractYulstorage2 = new YulStorage2();
    }

   function test_getValAtSlot3ForVal5()public{

    
    assertEq(contractYulstorage2.readSlot3Val5(),5);
      
    }
     function test_getslotForVal4()public{
        

    
    assertEq(contractYulstorage2.getSlot(),3);
      
    }

}

