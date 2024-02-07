// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Store} from "../src/Storage.sol";

contract StoreTest is Test{
    Store public contractStore;

    function setUp()public{
        contractStore = new Store();
        contractStore.setPersonData("lemon",100000,0,true,20000);

    }

    function test_SetPersonalData()public{
        
        
        
        assertEq(contractStore.getPersonData(0).isMember,true);
    }

    function getNetPay()public{
       uint net =  contractStore.getNetPay(0);
        assertEq(net,80000);
    }
    
}