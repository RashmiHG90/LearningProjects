//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.9 <0.9.0;

contract sttudent{

    string[] name;
    uint[] age;

    function setstudentdetails(string memory _name, uint _age) public {
        name.push(_name);
        age.push(_age);
    }

    function getstudentdetails(uint _index) public view returns(string memory, uint memory){
        return (name[_index], age[_index]);
    }

    function getallStudents() public view returns(string[] memory, uint[] memory){
        return (name, age);
    }
    
}