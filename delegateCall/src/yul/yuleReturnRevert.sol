// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract YulReturnRevert{
    function returnExample() external  pure returns(uint256,uint256){
        assembly{
            mstore(0x00,2) //32 bytes
            mstore(0x20,4)  //32 bytes
            return (0x00,0x40)  // 64 bytes
        }
    }

    function requireSolidityExample() external  view{
        require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,"not the guy");
    }

    function requireYulExample() external  view{
        assembly{
            if iszero(eq(caller(),0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)){
                revert(0,0)
            }
        }
        
    }
    function hashSolidityExample() external  pure returns(bytes32){
        bytes memory data = abi.encode(3,2,1);
        return keccak256(data);
            
        }
    function hashYulExample() external  pure returns(bytes32){
        assembly{
            //load and store the  free memory pointer
            let ptr := mload(0x40)

            //store 3,2,1 as contigous 32 byte words in memory

            mstore(ptr,1)
            mstore(add(ptr,0x20),2)
            mstore(add(ptr,0x40),3)
            //update the free memory at 0x40

            mstore(0x40,add(ptr,0x60))
            //keccak256 te data
            // at 0x80 -> 0x224 (6 bytes)
            //and store the results in the 0x0
            // memory scratch space
            mstore(0x00,keccak256(ptr,0x60))
            // return the 32 bytes in the 0x00 scratch space
            return(0x00,0x20)
        }
    } 
}