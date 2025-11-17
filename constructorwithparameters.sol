//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

//Parent contract with a parameterized constructor
contract Parent{
    string public name;
    constructor(string memory _name){
        name=_name;
    }
}

//child contract that calls the parent constructor

contract Child is Parent{
    uint public age;
    //Call parent constructor from inheritance list
    constructor(string memory _name,uint _age) Parent(_name){
        age=_age;
    }
}
