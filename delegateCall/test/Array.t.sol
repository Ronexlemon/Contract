import {Test} from "forge-std/Test.sol";

import {Array} from "../src/Array/array.sol";

contract ArrayTest is Test{
    Array public contractArray;

    function setUp()public{
        contractArray = new Array();
        contractArray.setSchoolDetails({ _schoolName:"Kenya High",  _numberOfStudents:100,  _numberOfStaff:100,  _isNational:false,  _privateSchool:true});
        contractArray.setSchoolDetails({ _schoolName:"Aliance High",  _numberOfStudents:1000,  _numberOfStaff:1023,  _isNational:true,  _privateSchool:false});
        contractArray.setSchoolDetails({ _schoolName:"JAm High",  _numberOfStudents:2000,  _numberOfStaff:1230,  _isNational:false,  _privateSchool:false});
        contractArray.setSchoolDetails({ _schoolName:"Kenyatta High",  _numberOfStudents:3800,  _numberOfStaff:5610,  _isNational:false,  _privateSchool:false});
        contractArray.setSchoolDetails({ _schoolName:"LEns High",  _numberOfStudents:10560,  _numberOfStaff:50,  _isNational:true,  _privateSchool:true});


    }
    function test_SetSchoolDetails()public{
        

        assertEq(contractArray.getArraySize(),5);

        
    }

    function test_getAllPrivateSchools()public{
      assertEq(  contractArray.getPrivateSchools()[0].numberOfStudents,100);
    }

    function test_getAllPublicSchools()public{
        
      assertEq(  contractArray.getAllPublicSchools()[0].numberOfStudents,1000);
    }
    function test_removetheLastSchool()public{
        
        uint arraysize=  contractArray.getArraySize();
        contractArray.removeLastschool();
        
        assertEq(contractArray.getAllSchools()[arraysize-2].numberOfStudents,3800);
    }


}