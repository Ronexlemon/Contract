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
       //bitwie masking
       //changing the value of the slot
      function setPacked(uint16 _newVal)public {
        assembly{
          // assume neavalue is 10 :=  0x000000000000000000000000000000000000000000000000000000000000000a
          let oldValue := sload(val5.slot) //returns bytes of slot 3
          // oldvalue =  0x0809000500000000000000000000000700000000000000000000000000000004
          // mask    =  0xffff0000fffffffffffffffffffffffffffffffffffffffffffffffffff // where thy is zero replace with zero
         let  mask    :=  0xffff0000fffffffffffffffffffffffffffffffffffffffffffffffffff
          let cleared := and(oldValue,mask)
           //  cleared = 0x0809000000000000000000000000000700000000000000000000000000000004
           let shifted := shl(mul(val5.offset,8),_newVal)

           // shifted  = 0x0000000a00000000000000000000000000000000000000000000000000000000
           let newValue := or(shifted,cleared)
           //  cleared = 0x0809000000000000000000000000000700000000000000000000000000000004
           // shifted  = 0x0000000a00000000000000000000000000000000000000000000000000000000
           // newValue = 0x0809000a00000000000000000000000700000000000000000000000000000004
           sstore(val5.slot,newValue)


        }
      }

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