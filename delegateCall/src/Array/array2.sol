// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Array{
    //fixed size array
    uint[]  myNumbers;
    string[] names;
    uint[10] fixedNumber;
    //nexted arrar
    uint[][] nested;
    uint index;
    
    function insertNumber(uint num)public{
        uint newIndex = index;
        names.push("yolloe");
        myNumbers.push(num);
        fixedNumber[newIndex]=num;
        index++;
    }
    

    function getOneValueFromRowColumn(uint row,uint col)public view returns(uint){
        return nested[row][col];
    }

    function getNumbersArray()public view returns(uint[] memory){
        return myNumbers;
    }
    function removeLastElement()public {
        myNumbers.pop();
    }

    function returnArrayLength()external  view returns(uint){
        return myNumbers.length;
    }
    function getValueFromIndex(uint _index)public view returns(uint){
        return myNumbers[_index];
    }
    function removefromAspecificIndex(uint _index)public{
        delete myNumbers[_index];
    }

    function deleteFromIndexAndChangeLength(uint _index)public{
        for (uint256 i = _index; i < myNumbers.length - 1; i++) {
    myNumbers[i] = myNumbers[i + 1];  //delete and change the length
}
myNumbers.pop();

    }
}