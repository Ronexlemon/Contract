// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
/* NOTE
* No garbage Colletion
* Memory is arrangedin 32 byte sequences
* Only 4 instructions: mload, mstore, mstore8 and msize
*/

contract YulMemory{
    

    function mstoreExample()public pure{
        assembly{
            mstore(0x0,0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
            mstore(0x0,0x0) //reset
            mstore(0x1,0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
        }
    }

    function mstore8Example()public  pure{
        assembly{
            mstore8(0x0,0x7)
            
        }
    }

    function abiEncode()public pure{
        bytes32 ptrStart;
        bytes32 ptrEnd;
        assembly{
            ptrStart := mload(0x40)
        }
    bytes memory data =    abi.encode(uint256(12),uint256(13)); // 0xc, 0xd

        assembly{
            ptrEnd := mload(0x40)
        }
        // logHelper("ptr (start)",ptrStart,"");
        //   logHelper("ptr (end)",ptrEnd,"");


    }

    function abiEncodePacked() public pure{
        bytes32 ptrStart;
        bytes32 ptrEnd;

        assembly{
            ptrStart := mload(0x40)
        }

        abi.encodePacked(uint256(14),uint128(15)); //0xe, 0xf

        assembly{
            ptrEnd := mload(0x40)
        }
    }

}