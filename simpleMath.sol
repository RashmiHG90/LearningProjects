//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimleMath{
    //Initialization of num1 and num2
    uint256 num1 = 10;
    uint256 num2 = 5;
    
    uint public additionaResult = num1+num2;
    uint public subtractionResult = num1- num2;
    uint public multiplicationResult = num1*num2;
    uint public divisionResult = num1/num2;
}