// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2 ;
import {Script} from "forge-std/Script.sol";
import {BoxV2} from "../src/UpgradeableContracts/Boxv2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployBox is Script{
    function run() external returns(address){
        
        address proxy = deployBox();
        return proxy;

    }
    function deployBox()public returns(address){
        BoxV2 box = new BoxV2(); //implementation logic
        ERC1967Proxy proxy = new ERC1967Proxy(address(box),"");
        return address(proxy);
    }

}