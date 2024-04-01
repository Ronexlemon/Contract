// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import {Script}  from "forge-std/Script.sol";
import {Calculation} from "../src/calculation.sol";


contract CalculationScript is Script{
    

    function run() external returns(Calculation){
        vm.startBroadcast();
      Calculation calc =  new Calculation();
        vm.stopBroadcast();
        return calc;

    }

}