// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Store} from "../src/Storage.sol";

contract StoreTest is Test{
    Store public contractStore;

    function setUp()public{
        contractStore = new Store();

    }

    function test_SetPersonalData()public{
        contractStore.setPersonData("lemon",100000,0,true,2000);
        
        assertEq(contractStore.persons[0].isMember)
    }
}