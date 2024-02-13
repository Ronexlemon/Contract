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

}