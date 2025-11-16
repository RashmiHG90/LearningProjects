//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract payment{
    address public addblock;

//write function
function setaddress(address _addblock) public{
    addblock=_addblock;
}

//read function
function getbalance() public view returns(uint){
    return addblock.balance;
}
}