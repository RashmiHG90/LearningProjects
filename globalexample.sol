//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Globalexample{
    address public senderAddress;
    function captureAddress() public{
        senderAddress = msg.sender; //Immediate caller (could be EOA or contract)
    }
}