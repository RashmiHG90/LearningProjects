//SPDX-license-Identifier:GPL-3.0
pragma solidity >=0.8.9;

contract Errorhandling{

    uint public balance=100;

    function withdrawmoney(uint _amount) public returns(uint){
        require(_amount<100, "Amount exceeds limit of 100");
        balance = balance - _amount;
        return balance;
    }
    //write something for assert
}