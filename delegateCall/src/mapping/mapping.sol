// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Mapping{
    struct Student{
        string name;
        string class;
        bool isActive;

    }

    mapping(uint => Student) public students;
    Student[] public student;

    uint student_index;

    function register(string memory _name,string memory _class)external {
        uint index = student_index;
        Student memory st = Student({name:_name,class:_class,isActive:false});
        students[index] = st;

        student.push(st);

        student_index ++;
    }


    function getStudentMapping()public view returns(Student[] memory  allStudents){
        allStudents = new Student[](student_index);

        uint index =0;
        for (uint i=0;i< student_index;++i){
            allStudents[index] = students[i];
            index ++;
        }
        return allStudents;
    }

    //using array

    function getStudentFromThesameClass(string memory class)external  view returns(Student[] memory result){
      uint count = 0;
        for (uint i = 0; i < student.length; i++) {
            if (keccak256(abi.encodePacked(student[i].class))  == keccak256(abi.encodePacked(class))) {
                count++;
            }
        }

        result = new Student[](count);
        uint index=0;
         for (uint i = 0; i < student.length; i++) {
            if (keccak256(abi.encodePacked(student[i].class))  == keccak256(abi.encodePacked(class))) {
                result[index] = student[i];
                index ++;
            }
        }

return result;


    }


    //using mapping

     function getStudentFromThesameClassUsingMapping(string memory class)external  view returns(Student[] memory result){
      uint count = 0;
        for (uint i = 0; i < student_index; i++) {
            if (keccak256(abi.encodePacked(students[i].class))  == keccak256(abi.encodePacked(class))) {
                count++;
            }
        }

        result = new Student[](count);
        uint index=0;
         for (uint i = 0; i < student_index; i++) {
            if (keccak256(abi.encodePacked(students[i].class))  == keccak256(abi.encodePacked(class))) {
                result[index] = students[i];
                index ++;
            }
        }

return result;


    }
}