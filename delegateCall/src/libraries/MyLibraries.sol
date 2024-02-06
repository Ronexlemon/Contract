// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

library Math {

    function Double(uint256 _value,uint256 _mul) internal view returns(uint){
        return (_value * _mul);
    }
    
}

library Stake{
    function ConstStake()external pure returns(uint256){
        return 40;
    }
}



