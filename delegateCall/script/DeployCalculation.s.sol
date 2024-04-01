// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import {Script}  from "forge-std/Script.sol";
import {Calculation} from "../src/calculation.sol";


contract CalculationScript is Script{
    

    function run() external{
        vm.startBroadcast();
        new Calculation();
        vm.stopBroadcast();

    }

}