//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract addresstest{
    address public msgsenderAddress;
    address public txorgAddress;

constructor(){
    msgsenderAddress = msg.sender;
    txorgAddress = tx.origin;
}

function getAddress() public view returns(address){
    return address(this); //using the msg.sender to find out the contract
    // address of a person who calls this function
}

function getbalance(address) public view returns(uint256){
    return msgsenderAddress.balance; // using the msg.sender to find out the contract 
    //address of a person who calls this function
}

function getmsgsenderAddress() public view returns(address){
    return msgsenderAddress; //using the msg.sender to find out the contract
    // address of a person who calls this function
} 

function gettxorgAddress() public view returns(address){
    return txorgAddress; //using the tx.origin to find out the contract
    // address of a person who calls this function
} 

function getoriginbalance(address) public view returns(uint256){
    return txorgAddress.balance; // using the tx.origin to find out the contract 
    //address of a person who calls this function
}
}