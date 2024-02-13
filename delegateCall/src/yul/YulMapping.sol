// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract YulMapping{

    mapping(uint256 => uint256)public simpleMapping;
    mapping(uint256 => mapping(uint256 => uint256) ) public nestedMapping;
    mapping(address => uint256[])public addressToListMapping ;

    constructor(){
        simpleMapping[88] =1;
        simpleMapping[99] =2;

        nestedMapping[9][8] = 7;
        nestedMapping[99][88]=77;

        addressToListMapping[msg.sender] = [55,66,77];
    }

    function getMappingValue(uint256 key) external view returns(uint256 value){
        uint256 slot;
        assembly{
            slot := simpleMapping.slot
        }

        bytes32 datalocation = keccak256(abi.encode(key,slot));

        assembly{
            value := sload(datalocation)
        }

    } 

    function getNestedMappingValue(uint256 key1,uint256 key2)external view returns(uint256 value){
        uint256 slot;
        assembly{
            slot := nestedMapping.slot
        }
        bytes32 dataLocation = keccak256(abi.encode(key2,keccak256(abi.encode(key1,slot))));

        assembly{
            value := sload(dataLocation)
        }

    } 

    function getAddressMappinArrayLength(address _address)external view returns(uint value){

        uint256 slot;
        assembly{
            slot := addressToListMapping.slot
        }

        bytes32 dataLocation = keccak256(abi.encode(_address,slot));
        assembly{
            value := sload(dataLocation)
        }

    }

     function getAddressMappinArrayValue(address _address,uint _index)external view returns(uint value){

        uint256 slot;
        assembly{
            slot := addressToListMapping.slot
        }

        bytes32 dataLocation = keccak256(abi.encode( keccak256(abi.encode(_address,slot))));
        assembly{
            value := sload(add(dataLocation,_index))
        }

    }
}