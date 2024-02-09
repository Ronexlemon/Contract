// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract YulStorage2{

    uint256 val =199; //slot 0
     uint256 val1=23; //slot 1
      uint256 val2=400; //slot 2
      //bein slot 3
      uint128 val3=4;
      uint96 val4=7;
      uint16 val5=5;
      uint8  val6 =9;

      //end of slot three

      function getslotAndOffset()external  pure returns(uint256 slot,uint256 offset){
        assembly{
            slot:= val5.slot
            offset:= val5.offset
        }
      }
      function readSlot3Val5() external  view returns(uint16 _val5){
        assembly{
            let value :=sload(val5.slot)
            let offset := val5.offset
            let shifted := shr(mul(offset,8),value) // 28 bytes * 8 =224 bits
            _val5:= and(0xffff,shifted)
        }
      }

      function getSlot()external pure returns(uint256 r){
        assembly{
            r:= val4.slot
        }
      }

      function setValBySlot(uint256 _slotIndex,uint256 _val)external{
        assembly{
            sstore(_slotIndex,_val)  //not recommended
        }
      }
      function getValBySlotIndex(uint256 _slotIndex)external view returns(bytes32 ret){

        assembly{
            ret:=sload(_slotIndex)
        }

      }


    function getValYul()external  view returns (uint256 r){
        assembly{
            // r:=val.slot // give the slot value
            r:= sload(val.slot)  //loads the real value
        }

    }

    function setVal(uint256 _val)public{
        val=_val;
    }

    function getVal()external view returns(uint256){
        return val;
    }
}