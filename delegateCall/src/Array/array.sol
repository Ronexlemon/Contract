// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Array {

    struct School {
        string schoolName;
        uint numberOfStudents;
        uint numberOfStaff;
        bool isNational;
        bool privateSchool;
    }

    School[] private AllSchools;

    function setSchoolDetails(string calldata _schoolName, uint _numberOfStudents, uint _numberOfStaff, bool _isNational, bool _privateSchool) public {
        School memory school = School({
            schoolName: _schoolName,
            numberOfStudents: _numberOfStudents,
            numberOfStaff: _numberOfStaff,
            isNational: _isNational,
            privateSchool: _privateSchool
        });
        AllSchools.push(school);
    }

    function getPrivateSchools() public view returns (School[] memory sch) {
        uint privateCount = 0;

        // Count private schools
        for (uint i = 0; i < AllSchools.length; i++) {
            if (AllSchools[i].privateSchool) {
                privateCount++;
            }
        }

        sch = new School[](privateCount);
        uint index = 0;

        // Populate the sch array with private schools
        for (uint j = 0; j < AllSchools.length; j++) {
            if (AllSchools[j].privateSchool) {
                sch[index] = AllSchools[j];
                index++;
            }
        }

        
    }

    function getAllPublicSchools()public view returns(School[] memory pub){
        uint publicCount =0;

        for (uint i; i< AllSchools.length;++i){
            if(!AllSchools[i].privateSchool){
                publicCount ++;

            }
        }
        pub = new School[](publicCount);
        uint index=0;

        for(uint j=0;j<AllSchools.length;++j){
            if(!AllSchools[j].privateSchool){
               pub[index] = AllSchools[j];
               index ++;

            }

        }
    }
    function removeLastschool()public{
        AllSchools.pop();
    }
    function getAllSchools()public view returns(School[] memory){
        return AllSchools;
    }
    function getArraySize()public view returns(uint){
        return AllSchools.length;
    }

}
