//SPDX-License-Identifiers: MIT

pragma solidity ^0.8.0;

contract MyContract {

    string public name;
    
    //Constructor runs once when the contract is deployed
    constructor(string memory _name){
        name = _name;
    }
}