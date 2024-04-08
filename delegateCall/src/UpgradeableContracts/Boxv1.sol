//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

//import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUgradeable";
//import {UUPSUpgradeable} from "@openzepplin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";

contract BoxV1{
    uint256 internal number;
    function getNumber()public view returns(uint256){
        return number;
    }

    function version()public pure returns(uint256){
        return 1;
    }
    
}