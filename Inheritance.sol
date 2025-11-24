//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Parent{
    string name= "Dr Ishu";
    uint8 id=32;
    string public qualification;

    function getId() public view returns(uint8){
        return id;
    }

    function setQualification(string memory _qualification) public {
        qualification=_qualification;
    }
}

contract child is parent{
    function getName() public view returns(string memory){
        return name;
    }
}